Versão de aplicativo mobile da aplicação web existente: new-mg-rifa

Criado em flutter por ser uma linguagem que contém um amplo ecossistema para desenvolver interfaces de maneira rápida e eficiente.

Riverpod - arquitetura de gerenciamento de estado escolhida.

Seguindo o contexto atual:

- Estado de UI complexo
- Precisa escalar no futuro
- apenas um desenvolvedor iniciante

1) Simplicidade - Simples de aplicar em comparação com Bloc, já que o Bloc gera muito código havendo um gasto de tempo maior com estrutura do que com lógica.
2) Escalabilidade - Mais escalável do que o Provider. Apesar do provider ser mais simples do que o Riverpod, ele não compensa em escalabilidade pois a medida que o app cresce vira uma grande bagunça com várias propriedades dessa arquitetura espalhadas por todo o código do projeto.
3) Multiuso - havendo necessidade de utilizar estados fora da UI (em services, repositories), é possível por não ser necessário o uso de BuildContext.
4) Para apenas um desenvolvedor - utilizar bloc por exemplo resultaria em excesso de engenharia, mas por ser apenas um desenvolvedor trabalhando, essa escolha torna mais fácil o desenvolvimento.