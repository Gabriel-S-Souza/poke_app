# PokeApp

<div style="display: flex; justify-content: center;">
  <img src="https://github.com/Gabriel-S-Souza/poke_app/assets/94877176/2942c80c-9cd1-469e-93b9-ce649a1f3abe" width="150" />
  <img src="https://github.com/Gabriel-S-Souza/poke_app/assets/94877176/f7f878d6-6b06-4844-a59b-96cda35833b7" width="150" />
  <img src="https://github.com/Gabriel-S-Souza/poke_app/assets/94877176/b5e261e9-441a-4dc2-a479-e1045005de64" width="150" />
  <img src="https://github.com/Gabriel-S-Souza/poke_app/assets/94877176/1ab0037b-0082-4d72-a236-853afbefbfcd" width="150" />
  <img src="https://github.com/Gabriel-S-Souza/poke_app/assets/94877176/be33a3fd-6281-49ec-9a10-363c90049e4c" width="150" />
</div>
<br>

O PokeApp é um aplicativo desenvolvido em Flutter com o objetivo de explorar os conceitos de Clean Architecture e outras técnicas de desenvolvimento de software. O app implementa o layout do figma [Pokedéx Community](https://www.figma.com/file/oyy40kpPCamOuJOQu1uYMo/Pok%C3%A9dex-(Community)?type=design&node-id=314-3&mode=design&t=Z5E2UVjFkqhk5inq-0) e consome a [Poke Finder API](https://github.com/Gabriel-S-Souza/poke_finder_api/tree/main) para exibir uma lista paginada de pokemons e permite a visualização dos detalhes do pokemon.
<br>

### Técnicas Utilizadas
- Clean Architecture
- Unit Tests
- Widget Tests
- Offline Mode (caching)
- Decorator Pattern
- SOLID Principles
- Dependency Injection
- Service Locator
- DRY
- AAA
- Factory
- Singleton
- State Management


### Alguns packages utilizados
- flutter_bloc
- dio
- get_it
- mocktail


### Executando o PokeApp

Certifique-se de ter o Flutter instalado em sua máquina. Caso contrário, siga as instruções de instalação disponíveis em [flutter.dev](https://flutter.dev/).

Versão do Flutter utilizada: 3.10.3

- Passos: <br>

1. Clone este repositório para o seu ambiente de desenvolvimento:

```
git clone https://github.com/Gabriel-S-Souza/poke_app.git
```

2. Abra o projeto em um editor de código.

3. Caso esteja com o FVM, rode o seguinde comando na raiz do projeto para que ele configure a versão do Flutter:
```
fvm use
```
4. Baixe as dependências do projeto:
```
flutter pub get
```
5. Conecte seu dispositivo ou inicie um emulador.

6. Execute o aplicativo:

```
flutter run
```
