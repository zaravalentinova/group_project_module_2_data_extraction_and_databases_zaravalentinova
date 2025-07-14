README 

Hola! 👋
Somos las Drama-Quer1es y queremos presentaros nuestro proyecto para MUSIC STREAM 🎶
 
Hemos construido un sistema automatizado que recolecta, organiza y almacena información musical desde plataformas como Spotify y Last.fm, integrándola en una base de datos relacional en MySQL.
El objetivo no es solo obtener datos, sino convertir esa información en conocimiento útil para comprender mejor el panorama musical actual: ¿Qué artistas destacan?, ¿Qué géneros están creciendo?, ¿Cómo se relacionan entre sí los músicos?, ¿Qué temáticas predominan?, entre muchos otros 📈. 

📊 Estructura: 
-	Extracción de datos desde Spotify:
Usamos la API de Spotify para obtener canciones de los géneros pop, metal, rap y reggaetón, entre los años 2015 y 2016, con la facilidad de cambiar estos parámetros según sea el objetivo.
-	Procesamiento inicial:
Estructuramos los datos en formato CSV, identificando si las canciones son colaboraciones, y extrayendo nombres limpios de los artistas.
-	Enriquecimiento de datos desde Last.fm:
Para cada artista, consultamos su biografía, número de oyentes, reproducciones y artistas similares.
-	Carga de datos en MySQL:
Insertamos los datos procesados en una base de datos relacional, creando relaciones entre artistas y canciones para futuras consultas.

🧰 Herramientas usadas: 
•	🎧 Spotify API – Para obtener canciones por género y año.
•	📡 Last.fm API – Para conseguir información detallada sobre artistas.
•	🐍 Python – Para automatizar procesos de extracción, limpieza y carga (ETL).
•	🐬 MySQL – Como base de datos relacional para análisis.
•	📁 CSV – Para exportar e importar datos estructurados.

⚠️ Importante: 
Abre el archivo principal y reemplaza las claves de autenticación por las tuyas:
CLIENT_ID = 'TU_CLIENT_ID_SPOTIFY'
CLIENT_SECRET = 'TU_CLIENT_SECRET_SPOTIFY'
API_KEY_LASTFM = 'TU_API_KEY_LASTFM'
