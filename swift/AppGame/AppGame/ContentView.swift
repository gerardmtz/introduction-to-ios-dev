//
//  ContentView.swift
//  AppGame
//
//  Created by geralduwu on 2025-06-01.
//

import SwiftUI
import AVFoundation

// MARK: - SoundPlayer
class SoundPlayer {
    var audioPlayer: AVAudioPlayer?

    func playSound
    (
        named soundName: String,
        ofType fileType: String
    ) {
        guard let path = Bundle.main.path(
            forResource: soundName, ofType: fileType
        ) else {
            print("Sound file \(soundName).\(fileType) not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(
                contentsOf: URL(fileURLWithPath: path)
            )
            audioPlayer?.play()
        } catch {
            print(
                "Could not create audio player: \(error.localizedDescription)"
            )
        }
    }
}

// MARK: - GameObject Protocol & Models
protocol GameObject: Identifiable, Equatable {
    var id: UUID { get }
    var position: CGPoint { get set }
    var size: CGSize { get }
    var isAlive: Bool { get set }
    var rect: CGRect { get }
}

extension GameObject {
    var rect: CGRect {
        CGRect(
            x: position.x - size.width / 2,
            y: position.y - size.height / 2,
            width: size.width,
            height: size.height
        )
    }
}

struct Asteroid: GameObject {
    let id = UUID()
    var position: CGPoint
    let size: CGSize = CGSize(width: 50, height: 50)
    var isAlive: Bool = true
    let speed: CGFloat
}

struct Laser: GameObject {
    let id = UUID()
    var position: CGPoint
    let size: CGSize = CGSize(width: 8, height: 25)
    var isAlive: Bool = true
    let speed: CGFloat = 10
}

// MARK: - GameScene (ObservableObject)
class GameScene: ObservableObject {
    @Published var spaceshipPosition: CGPoint = .zero
    @Published var lasers: [Laser] = []
    @Published var asteroids: [Asteroid] = []
    @Published var score: Int = 0
    @Published var lives: Int = 3
    @Published var isGameActive: Bool = false
    @Published var showGameOver: Bool = false

    // Sound players
    let laserSoundPlayer = SoundPlayer()
    let explosionSoundPlayer = SoundPlayer()
    let gameOverSoundPlayer = SoundPlayer()

    // Layout / timers
    var gameWidth: CGFloat = 0
    var gameHeight: CGFloat = 0
    var asteroidSpawnTimer: Timer?
    var gameLoopTimer: Timer?

    // MARK: - Setup & Control
    func setupGame(width: CGFloat, height: CGFloat) {
        self.gameWidth = width
        self.gameHeight = height
        spaceshipPosition =
            CGPoint(x: width / 2, y: height - 80)
        resetGame()
    }

    func startGame() {
        resetGame()
        isGameActive = true
        showGameOver = false
        score = 0
        lives = 3

        gameLoopTimer =
            Timer.scheduledTimer(
                withTimeInterval: 0.02,
                repeats: true
            )
        {
            [weak self] _ in
            self?.updateGame()
        }

        asteroidSpawnTimer = Timer.scheduledTimer(
            withTimeInterval: 1.5,
            repeats: true
        )
        {
            [weak self] _ in
            self?.spawnAsteroid()
        }
    }

    func resetGame() {
        gameLoopTimer?.invalidate()
        asteroidSpawnTimer?.invalidate()
        lasers.removeAll()
        asteroids.removeAll()
        score = 0
        lives = 3
        isGameActive = false
        showGameOver = false
    }

    func endGame() {
        isGameActive = false
        showGameOver = true
        gameLoopTimer?.invalidate()
        asteroidSpawnTimer?.invalidate()
        gameOverSoundPlayer.playSound(
            named: "game_over", ofType: "mp3"
        )
    }

    // MARK: - Game Loop
    private func updateGame() {
        guard isGameActive else { return }

        // 1. Move lasers upward
        for i in 0..<lasers.count {
            lasers[i].position.y -= lasers[i].speed
            if lasers[i].position.y < 0 {
                lasers[i].isAlive = false
            }
        }

        // 2. Move asteroids downward
        for i in 0..<asteroids.count {
            asteroids[i].position.y += asteroids[i].speed
            if asteroids[i].position.y > gameHeight {
                asteroids[i].isAlive = false
                lives -= 1
                if lives <= 0 {
                    endGame()
                }
            }
        }

        // 3. Detect collisions (laser vs asteroid)
        for i in 0..<lasers.count {
            guard lasers[i].isAlive else { continue }
            for j in 0..<asteroids.count {
                guard asteroids[j].isAlive else { continue }
                if lasers[i].rect.intersects(asteroids[j].rect) {
                    lasers[i].isAlive = false
                    asteroids[j].isAlive = false
                    score += 10
                    explosionSoundPlayer.playSound(
                        named: "explosion",
                        ofType: "mp3"
                    )
                }
            }
        }

        // 4. Clean up off‐screen / destroyed objects
        lasers.removeAll { !$0.isAlive }
        asteroids.removeAll { !$0.isAlive }
    }

    // MARK: - Player Action
    func fireLaser() {
        guard isGameActive else { return }
        let newLaser = Laser(
            position: CGPoint(
                x: spaceshipPosition.x,
                y: spaceshipPosition.y - 40
            )
        )
        lasers.append(newLaser)
        laserSoundPlayer.playSound(named: "laser_fire", ofType: "mp3")
    }

    func moveShip(to newX: CGFloat) {
        guard isGameActive else { return }
        
        // Use half the spaceship's width (font size 60 / 2) for clamping
        let halfShipWidth = CGFloat(30)
        
        // Clamp the position to keep the ship within the screen bounds
        spaceshipPosition.x = max(
            halfShipWidth,
            min(newX, gameWidth - halfShipWidth)
        )
    }

    // MARK: - Spawn Asteroid
    private func spawnAsteroid() {
        guard isGameActive else { return }
        let randomX = CGFloat.random(
            in: 30...(gameWidth - 30)
        )
        let asteroidSpeed = CGFloat.random(in: 2...5)
        let newAsteroid = Asteroid(
            position: CGPoint(x: randomX, y: -50),
            speed: asteroidSpeed
        )
        asteroids.append(newAsteroid)
    }
}

// MARK: - ContentView
struct ContentView: View {
    @StateObject private var gameScene = GameScene()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.black
                    .edgesIgnoringSafeArea(.all)

                // Spaceship (now movable)
                Image(systemName: "airplane")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .position(gameScene.spaceshipPosition)

                // Lasers
                ForEach(gameScene.lasers)
                { laser in
                    Rectangle()
                        .fill(Color.red)
                        .frame(
                            width: laser.size.width,
                            height: laser.size.height
                        )
                        .position(laser.position)
                }

                // Asteroids
                ForEach(gameScene.asteroids)
                {
                    asteroid in
                    Circle()
                        .fill(Color.gray)
                        .frame(
                            width: asteroid.size.width,
                            height: asteroid.size.height
                        )
                        .position(asteroid.position)
                }

                // Score & Lives UI
                VStack {
                    HStack {
                        Text("Score: \(gameScene.score)")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        Spacer()
                        Text("Lives: \(gameScene.lives)")
                            .font(.title2)
                            .foregroundColor(.red)
                            .padding(.trailing, 20)
                    }
                    Spacer()
                }

                // Start / Game Over Overlay
                if !gameScene.isGameActive {
                    VStack {
                        if gameScene.showGameOver {
                            Text("GAME OVER!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                                .padding(.bottom, 20)
                        }
                        Button(action: {
                            gameScene.startGame()
                        })
                        {
                            Text(
                                gameScene.showGameOver ?
                                    "Play Again" :
                                    "Start Game"
                            )
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 40)
                                .background(Color.green)
                                .cornerRadius(25)
                                .shadow(radius: 10)
                        }
                    }
                }
            }
            .onAppear {
                // Initialize with actual size
                gameScene.setupGame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        // Move the ship by tracking the finger's x-position
                        gameScene.moveShip(to: value.location.x)
                    }
                    .onEnded { _ in
                        // Fire a laser when the drag gesture ends (finger is lifted)
                        gameScene.fireLaser()
                    }
            )
        }
    }
}

#Preview {
    ContentView()
}
