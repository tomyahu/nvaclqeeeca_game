# GDD No vas a creer lo que encontre en esta casa abandonada



## Menú de Título

La app de menú de título tendrá opciones para iniciar una nueva partida y para configurar datos. Deseablemente poder configurar los controles.

* **Boton de Nueva Partida:** Empieza la primera cutscene
* **Boton de Configuracion:** Poder configurar:
  * **BGM:** Volumen música
  * **SFX:** Efectos de Sonido
  * **Velocidad de Texto (Deseable):** Velocidad del texto para diálogos
  * **Deshabilitar Chat de Twitch (Deseable)**
  * **Pantalla Completa**
* **Boton de Salir:** Para salir del juego
* **Fondo como dashboard de youtub:** Copiar la UI de youtub basicamente
  * Botón de nueva partida es el thumbnail del stream
  * Configuracion tiene una ruedita
  *  Salir es una x para cerrar la ventana

## Gameplay

El juego tendrá 12 niveles divididos en 3 partes.

* **Introducción (2 niveles):** Introducimos a drex, un  streamer de youtub que se está metiendo a una casa abandonada. Estos dos niveles parten con una cutscene de Drex y son una especie de tutorial mostrando las condiciones de derrota de Drex. Terminan con Drex conociendo a Esme.

### Mecánicas

#### Movimiento Top Down

El movimiento de Drex será Top-Down, simple y sencillo.

##### Obstáculos

Los obstáculos serán cosas que detienen movimiento

* Cajas
* Paredes

#### Índice de Ruido

Al chocar y pisar cosas Drex aumentará el índice de ruido. Si el índice de ruido llega a 100% entonces vendrá la policía y Drex perderá.

Cosas que puede pisar por ejemplo son:

* botellas de vidrio rotas
* montón grande de vidrio
* Loza rota
* monton grande de loza
* tablas sueltas

#### Cámara hacia el otro mundo

Luego de conocer a Esme, Drex podrá ver las cosas como eran el el pasado usando la cámara de su teléfono. La cámara funcionará igual que una linterna, lo que no está iluminado se vé como el mundo real, y lo que está iluminado corresponde al mundo de Esme.

#### Movimiento Esme

Drex puede llamar a Esme en cualquier momento, haciendo que Esme se mueva en una línea recta hacia la posición de Drex. Si Esme está en movimiento tendrá que terminar ese movimiento para poder ser llamado de nuevo. Si Esme choca con algo entonces volverá a la posición inicial.

#### Índice de Ruido (Esme)

Si Esme choca con cosas aumentará el índice de ruido, dependiendo de con qué aumenta distinta cantidad. Ejemplos

* Paredes
* Mesas
* Pianos

#### Hoyos

En los niveles más adelante habrán hoyos en el mundo real, si Drex cae en ellos es un inmediato Game Over

#### Oscuridad (Idea)

Funcionaría igual que la cámara hacia el otro mundo, sólo que el nivel es completamente oscuro y Drex tiene que alumbrar el camino para ver hacia donde va.

Podría ser que la oscuridad funcione igual que la camara al otro mundo pero que Esme emita una tenue luz que Drex puede usar para ver.

#### Timer (Idea)

En niveles más adelante podría haber un timer, puede que esme se pone a gritar y alerta a la policia, entonces el timer reemplaza el índice de ruido. Puede tambien que algo pase en el otro mundo y esme tiene poco tiempo.

### UI

Los elementos importantes a mostrar en la UI son el Índice de Ruido y el Chat de Youtub.

#### Índice de Ruido

Abajo al medio de la pantalla, una barra vertical con un número asociado.

#### Chat de Youtub

El chat está siempre al lado derecho de la pantalla, haciendo comentarios sobre lo que está pasando. Esto incluye partes de cutscenes, cuando todo está normal, cuando Drex mete ruido y cuando Esme mete ruido.

### Cutscenes

Las cutscenes usarán un scheduler para hacer que los personajes se muevan y triggerear distintos efectos. A continuación hay una lista de eventos a implementar

* Mover a un personaje en linea recta
* Dos saltos para indicar sorpresa
* Tiritar para indicar miedo
* Un salto para indicar decision
* Texto de un personaje
  * UI sería un rectangulo de texto y una flechita a quien lo dijo
  * UI podría ser una burbuja de texto
* Mostrar el chat
* Ocultar el chat
* Cambiar el pool de mensajes del chat
* SFX
* cambio BGM
* Prender y apagar la cámara hacia el otro mundo
* Rotar la cámara hacia el otro mundo

## Game Over

La pantalla de game over tendrá una ilustración pequeña y dos botones: Continuar y Pantalla de Título

## Créditos

Presentación de power point con ilustraciones de drex chistosas
