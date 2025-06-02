# Documentación - AppSensor

Este archivo forma parte de la aplicación **AppSensor** y contiene la implementación de la clase `ViewController`, encargada de controlar la interfaz y el comportamiento relacionado con el **sensor de proximidad** del dispositivo iOS.

---

## Importación de librerias

```c
#import "ViewController.h"
```

Se importa el encabezado correspondiente a este controlador de vista.

---

## Métodos del ciclo de vida

### `viewDidLoad`

```c
- (void)viewDidLoad {
    [super viewDidLoad];

    // Habilita la monitorización del sensor de proximidad
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;

    // Verifica el estado inicial del sensor
    [self updateSensorStatus];

    // Registra una notificación para detectar cambios en el estado del sensor
    [[NSNotificationCenter defaultCenter] 
        addObserver:self
        selector:@selector(proximityStateDigChange:)
        name:UIDeviceProximityStateDidChangeNotification
        object:nil];

    NSLog(@"Proximity monitoring enabled");
}
```

Este método:

- Habilita la detección del sensor de proximidad.
- Actualiza el estado inicial del sensor.
- Registra una notificación para detectar cambios en el estado del sensor.

---

### `viewWillDisappear`

```c
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // Deshabilita el sensor y elimina el observador
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self
        name:UIDeviceProximityStateDidChangeNotification
        object:nil];

    NSLog(@"Proximity monitoring disabled");
}
```

Este método:

- Desactiva el sensor de proximidad.
- Elimina el observador de notificaciones para evitar fugas de memoria o consumo innecesario de batería.

---

## Notificación del sensor

### `proximityStateDigChange`

```c
- (void)proximityStateDigChange:(NSNotification *)notification {
    NSLog(@"Proximity state changed!");
    [self updateSensorStatus];
}
```

Este método se llama automáticamente cuando el estado del sensor cambia, y actualiza la interfaz en consecuencia.

---

## Lógica de actualización

### `updateSensorStatus`

```c
- (void)updateSensorStatus {
    BOOL isClose = [UIDevice currentDevice].proximityState;

    if (isClose) {
        self.statusLabel.textColor = [UIColor whiteColor];
        self.statusLabel.text = @"Sensor Covered!";
        self.view.backgroundColor = [UIColor blackColor];
        NSLog(@"Sensor is CLOSE");
    } else {
        self.statusLabel.textColor = [UIColor blackColor];
        self.statusLabel.text = @"Sensor is Uncovered!";
        self.view.backgroundColor = [UIColor whiteColor];
        NSLog(@"Sensor is NOT close");
    }
}
```

Este método:

- Consulta el estado actual del sensor de proximidad.
- Actualiza la interfaz (texto, color de fondo, etc.) dependiendo de si el sensor está cubierto o no.

---

## Limpieza

### `dealloc`

```c
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
```

Elimina cualquier observador restante al liberar la memoria del controlador. Esto es buena práctica para prevenir errores o comportamientos inesperados.

---

## Notas

- Esta implementación es útil para apps que reaccionan a eventos físicos, como cuando el usuario acerca el dispositivo al oído.
- Se evita el consumo innecesario de recursos al desactivar el sensor cuando la vista no está visible.
