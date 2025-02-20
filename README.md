# Tutorial 2
<h3>Latihan: Playtest</h3>
<dl>
<dt>- Apa saja pesan <i>log</i> yang dicetak pada panel Output?<br></dt>
<dd>Pada awal playtest dimulai, pesan 'Platform initialized' muncul di log.<br></dd>
<dt>- Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?<br></dt>
<dd>'Reached objective!'<br></dd>
<dt>- Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?<br></dt>
<dd>Setiap kali body 'BlueShip' (secara spesifik, CollisionShape2D BlueShip) masuk ke dalam area ObjectiveArea atau dengan kata lain ObjectiveArea mendeteksi collision dengan BlueShip, pesan 'Reached objective!' akan di output.</dd>
</dl>

<dl>
<h3>Latihan: Memanipulasi Node dan Scene</h3>
<p>- Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe Sprite. Apa fungsi dari node bertipe Sprite?<br>
Node Sprite digunakan untuk mendisplay 2D texture, yaitu mendisplay gambar yang dapat dilihat dari suatu objek 2D.<br>
- Root node dari scene BlueShip dan StonePlatform menggunakan tipe yang berbeda. BlueShip menggunakan tipe RigidBody2D, sedangkan StonePlatform menggunakan tipe StaticBody2D. Apa perbedaan dari masing-masing tipe node?<br>
Perbedaan dari StaticBody2D dan RigidBody2D adalah StaticBody2D tidak dapat digerakkan lewat kekuatan eksternal (<i>external forces</i>) dan juga tidak dapat gerakkan objek lain. Di sisi lainnya, RigidBody2D dapat bergerak menurut <i>physics engine</i>, yaitu dapat diefek oleh objek lain dan kekuatan seperti <i>gravity</i>.<br>
- Ubah nilai atribut Mass pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?<br>
Dari percobaan yang saya lakukan, tidak ada perubahan yang datang dari tambahnya/kurangnya atribut Mass yang bisa kelihatan.<br>
- Ubah nilai atribut Disabled pada tipe CollisionShape2D di scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?<br>
Saat atribut Disabled dicentang, pesan 'Reached objective!' tidak muncul walaupun BlueShip masuk ke dalam daerah dimana ada CollisionShape2Dnya. Ini karena selama attribut Disable pada suatu CollisionShape2D dicentang, collision shape itu tidak akan memiliki dampak terhadap gameworld.<br>
- Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?<br>
 - Position: Jika X ditambah, visualisasi BlueShip akan pindah ke kanan, dan jika dikurang akan ke kiri. Jika Y ditambah, visualisasi akan menurun dan sebaliknya akan naik jika Y dikurang.<br>
 - Rotation: Visualisasi BlueShip akan rotasi mengikuti nilai yang dimasukkan di attribut Rotasi. Rotasi ini memiliki pusat yang berada di tengah sprite (<i>the rotation is centered around a point that has been determined. In this case, it is the center of the BlueShip object</i>).<br>
 - Scale: Visualisasi BlueShip yang berada di viewport berubah ukuran mengikuti scale. Karena <i>Component Ratio</i> dari Scalenya BlueShip besifat <i>locked</i>, perubahan ke scale x (horizontal) akan diikuti juga di y (vertikal) dan sebaliknya. Jika di unlock, scale x dan y dapat diubah secara lebih bebas.<br>
- Pada scene MainLevel, perhatikan nilai atribut Position node PlatformBlue, StonePlatform, dan StonePlatform2. Mengapa nilai Position node StonePlatform dan StonePlatform2 tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?<br>
Posisi PlatformBlue, StonePlatform, dan StonePlatform2 adalah (35, 565), (0, 0), dan (70, 0), dengan format (x, y). PlatformBlue merupakan parent node dari StonePlatform dan StonePlatform2, sehingga keduanya mengukur positionnya relatif ke PlatformBlue. StonePlatform ada di bagian kiri atas dari PlatformBlue, sehingga memiliki posisi (0,0), sedangkan StonePlatform2 berada di kanannya, sehingga X-nya lebih tinggi.</p>
</dl>