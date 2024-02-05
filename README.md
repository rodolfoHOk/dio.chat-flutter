# Chat Flutter

> Desafio Potencializando o seu App Flutter com Cloud Firestore da DIO

## Checklist do Desafio

- Criar uma aplicação Flutter​
- Criar banco de dados no Firestore​
- Criar uma tela de escolha de salas​
- Criar chat separado por salas​
- Usuário informará o nome​
- Incluir recursos a escolha do(a) aluno(a)

## Tecnologias

- Dart
- Flutter
- Firebase
- Firebase Firestore (NoSQL real time database)
- Firebase Remote config
- Firebase Crashlytics
- Firebase Analytics

### Bibliotecas adicionais

- firebase_core
- cloud_firestore
- firebase_remote_config
- firebase_crashlytics
- firebase_analytics
- intl
- get_it
- shared_preferences
- uuid

## Galeria de Imagens do projeto

<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-01.png" alt="Chat Flutter Image 01" width="225"/>
<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-02.png" alt="Chat Flutter Image 02" width="225"/>

<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-03.png" alt="Chat Flutter Image 03" width="225"/>
<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-04.png" alt="Chat Flutter Image 04" width="225"/>

<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-05.png" alt="Chat Flutter Image 05" width="225"/>
<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-06.png" alt="Chat Flutter Image 06" width="225"/>

<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-07.png" alt="Chat Flutter Image 07" width="225"/>
<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-08.png" alt="Chat Flutter Image 08" width="225"/>

<img src="https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/dio-chat-flutter-09.png" alt="Chat Flutter Image 09" width="225"/>

## Rodar

### Requisitos

- Flutter instalado
- Android Studio
- Android SDK command line tools
- Clonar este repositório

### Executar

- Abrir um dispositivo emulado Android
- Terminal na raiz do projeto: flutter run

## Deployment PlayStore

- criar a key store: keytool -genkey -v -keystore android/app/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias appkey

- criar android/key.properties :

```
storePassword=<password-from-previous-step>
keyPassword=<password-from-previous-step>
keyAlias=upload
storeFile=<keystore-file-location>
```

- configurar: android/app/build.gradle :

```
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
      ...
}
```

```
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
        storePassword keystoreProperties['storePassword']
    }
}
buildTypes {
    release {
        signingConfig signingConfigs.release
    }
}

```

- habilitar multidex support: flutter run --debug

- adicionar permissões de uso no android/app/src/main/AndroidManifest.xml:

```
</manifest>
    ...
    </application>

    <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
```

- configurar o app version no android/app/build.gradle
 
- configurar o app version no pubspec.yaml

- fazer o build do apk: flutter build apk

- fazer o build do appbundle: flutter build appbundle

- [Google Play Console](https://play.google.com/console/signup)

- [Preparar e lançar uma versão](https://support.google.com/googleplay/android-developer/answer/9859348?hl=pt-br&visit_id=638427467679923829-3057949478&rd=1)

- [Firebase Console](https://console.firebase.google.com/?hl=pt-br)

```
Firebase Console > Liberar e monitorar > App distribution > Vamos começar > Arrastar o arquivo build/app/apk/release/app-release.apk

Adicionar testadores > Próxima > Adicione as notas da versão > Distribuir para x testadores
```
