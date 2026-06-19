## Lista de bugs/melhorias

###### Celular usado durante os testes: Redmi 15C

1 - Tamanho da tela não está adequado - o botão de Cadastrar ficou embaixo dos botões nativos da interface do celular (voltar, home, etc)

2 - Funcionalidade de Cadastrar não está funcionando ou não foi implementada - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

3 - Funcionalidade de Recuperar a senha não está funcionando ou não foi implementada - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

4 - Funcionalidade de Alterar email não está funcionando ou não foi implementada - aparece página de Not Found; poderia ser uma tela mais informativa e amigável para o usuário

5 - Depois de tentar acessar a funcionalidade de Alterar email, não é possível voltar para a home; é necessário reiniciar o aplicativo - experiência ruim para o usuário

6 - O login não é persistido após o usuário reiniciar o aplicativo - isso pode ser uma decisão consciente, mas pode ser melhor que o login se mantenha ativo por um período pelo menos curto de tempo, para que o usuário não precise logar toda vez que entra no app

7 - 4 - Funcionalidade de Alterar senha não está funcionando ou não foi implementada - aparece página de Not Found; poderia ser uma tela mais informativa e amigável para o usuário

8 - Depois de tentar acessar a funcionalidade de Alterar senha, não é possível voltar para a home; é necessário reiniciar o aplicativo - experiência ruim para o usuário

9 - Botão de Permissões nas configurações não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

10 - Não há um botão explícito de sair da tela de configurações - isso é feito pressionando-se o botão de configurações novamente; seria melhor se tivesse um botão que indicasse explicitamente a ação de voltar/fechar as configurações, pois pode não ser óbvio para todos os usuários que ele precisa clicar de novo no mesmo botão para voltar, ainda que a cor do botão mude nas duas telas

11 - Na tela inicial do aplicativo (logado), é possível perceber que ela também não se adequou bem ao tamanho da tela do meu celular, pois há um componente que aparentemente não conseguiu ser renderizado - com uma aparência de Warning, amarela e preta, com um aviso "Bottom overflowed by 226 pixels", indicando que o app tentou renderizar além do limite da tela e não conseguiu; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo; além disso, é possível perceber que há um componente embaixo do botão de Medicamentos, possivelmente um outro botão, que não foi possível acessar, provavelmente devido a essa falha de renderização na tela; se a tela tivesse pelo menos um scroll, talvez já resolvesse, mas também não foi possível rolar a tela para baixo

12 - No Botão Dor, assim que ele é clicado, aparece uma opção de Salvar, o que não faz muito sentido, pois ainda não foi selecionado nenhuma opção, então não há o que salvar; além disso, ele também não funciona ou não foi implementado, e em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

13 - Na frase que aparece ao clicar nas opções de dor para selecionar o nível da dor, falta pontuação adequada: "de 0 a 10, qual nível da  sua dor nas mãos" está sem ponto de interrogação, apesar de ser uma pergunta

14 - Ao selecionar múltiplas opções de DOR, o aplicativo não permite escolher o nível de dor a partir da segunda opção escolhida - ele permanece com o nível escolhido na primeira opção ativo e não deixa eu escolher outro nível para a segunda opção; por exemplo: ao escolher "Mãos" e nível 4, se eu seleciono depois "Ombro", o nível 4 de dor continua selecionado para todas as opções que eu escolher, até que eu desmarque a opção "Mãos" (pois foi a primeira que selecionei) e só então ele desmarca o nível selecionado

15 - Não é possível salvar a DOR escolhida após escolher uma opção e seu nível, os botões de Cancelar e Salvar somem; existe a chance deles terem ido para baixo da fraque que aparece ao selecionar uma opção, mas para o usuário parece que eles apenas sumira, e impossibilita que as escolhas sejam salvas de qualquer forma

16 - Na tela do botão Fadiga, existe um ícone de informação que não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

17 - O botão Salvar a fadiga não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

18 - A frase "de 0 a 10, como está seu nível de fadiga hoje?" está sem acento no "está"

19 - A frase "de 0 a 10, como está seu nível de sono hoje?" está sem acento no "está"

20 - O botão Salvar o sono não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

21 - Na tela do botão Inchaço, existe um ícone de informação que não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

22 - A frase "de 0 a 10, como qual nível de inchaço nas mãos" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

23 - A frase "de 0 a 10, como qual nível de inchaço no ombro" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

24 - A frase "de 0 a 10, como qual nível de inchaço no quadril" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

25 - A frase "de 0 a 10, como qual nível de inchaço no tornozelo" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

26 - A frase "de 0 a 10, como qual nível de inchaço no braço" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

27 - A frase "de 0 a 10, como qual nível de inchaço na coluna" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

28 - A frase "de 0 a 10, como qual nível de inchaço no joelho" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

29 - A frase "de 0 a 10, como qual nível de inchaço nos pés" está sem ponto de interrogação e seria melhor se tivesse um artigo "o" antes de "nível"

30 - Ao selecionar múltiplas opções de Inchaço, o aplicativo não permite escolher o nível de inchaço a partir da segunda opção escolhida - ele permanece com o nível escolhido na primeira opção ativo e não deixa eu escolher outro nível para a segunda opção; por exemplo: ao escolher "Mãos" e nível 4, se eu seleciono depois "Ombro", o nível 4 de inchaço continua selecionado para todas as opções que eu escolher, até que eu desmarque a opção "Mãos" (pois foi a primeira que selecionei) e só então ele desmarca o nível selecionado

31 - Não é possível salvar o Inchaço escolhido após escolher uma opção e seu nível, os botões de Cancelar e Salvar somem; existe a chance deles terem ido para baixo da fraque que aparece ao selecionar uma opção, mas para o usuário parece que eles apenas sumira, e impossibilita que as escolhas sejam salvas de qualquer forma

32 - O botão Adicionar medicamento não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

33 - Não é possível salvar os medicamentos selecionados

34 - Falta um botão de Voltar na tela de Medicamentos, para não depender apenas do botão de Voltar do celular - além disso, quando eu voltei com a opção do celular, o app fechou sozinho

35 - Na tela de Exercícios, o terceiro botão "Informações sobre atividades físicas" está com o texto cortado, a altura pode não estar ajustada

36 - Na tela de exercícios para mãos, o botão "Qual devo escolher?" não está com um layout bom

37 - Na tela de exercícios para mãos, o modal aberto após o botão "Qual devo escolher" ser clicado não tem um botão de fechar - não é bom confiar apenas na capacidade do usuário de entender que o modal pode ser fechado ao clicar fora da tela

38 - Na tela de exercícios iniciantes para as mãos, a top bar está com o texto cortado

39 - Na tela de exercícios iniciantes para as mãos, a lista de exercícios vem com um aparente botão que não faz nada ao ser clicado; pode ser que ele não seja um botão, e nesse caso seria melhor removê-lo ou pelo menos alterar a aparência para que não pareça um botão; e se ele for mesmo um botão, não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

40 - No modal que é aberto após iniciar os exercícios iniciantes para as mãos, ele está com um tamanho inadequado para a tela; não é possível rolar para baixo e aparece um possível componente com erro de renderização, com aparência de warning amarela e preta e uma frase "bottom overflowed by 132 pixels"; possivelmente é o botão de continuar, pois ele não está em lugar nenhum e, dessa forma, não é possível fazer os exercícios; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo

41 -  No modal que é aberto após iniciar os exercícios iniciantes para as mãos, falta um botão de fechar

42 - Na tela de exercícios intermediários para as mãos, a top bar está com o texto cortado

43 - Na tela de exercícios intermediários para as mãos, a lista de exercícios vem com um aparente botão que não faz nada ao ser clicado; pode ser que ele não seja um botão, e nesse caso seria melhor removê-lo ou pelo menos alterar a aparência para que não pareça um botão; e se ele for mesmo um botão, não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

44 - No modal que é aberto após iniciar os exercícios intermediários para as mãos, ele está com um tamanho inadequado para a tela; não é possível rolar para baixo e aparece um possível componente com erro de renderização, com aparência de warning amarela e preta e uma frase "bottom overflowed by 132 pixels"; possivelmente é o botão de continuar, pois ele não está em lugar nenhum e, dessa forma, não é possível fazer os exercícios; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo

45 -  No modal que é aberto após iniciar os exercícios intermediários para as mãos, falta um botão de fechar

46 - Na tela de exercícios avançados para as mãos, a top bar está com o texto cortado

47 - Na tela de exercícios avançados para as mãos, a lista de exercícios vem com um aparente botão que não faz nada ao ser clicado; pode ser que ele não seja um botão, e nesse caso seria melhor removê-lo ou pelo menos alterar a aparência para que não pareça um botão; e se ele for mesmo um botão, não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

48 - No modal que é aberto após iniciar os exercícios avançados para as mãos, ele está com um tamanho inadequado para a tela; não é possível rolar para baixo e aparece um possível componente com erro de renderização, com aparência de warning amarela e preta e uma frase "bottom overflowed by 132 pixels"; possivelmente é o botão de continuar, pois ele não está em lugar nenhum e, dessa forma, não é possível fazer os exercícios; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo

49 -  No modal que é aberto após iniciar os exercícios avançados para as mãos, falta um botão de fechar

50 - Na tela de exercícios para mãos, o botão "Qual devo escolher?" não está com um layout bom

51 - Na tela de exercícios para mãos, o modal aberto após o botão "Qual devo escolher" ser clicado não tem um botão de fechar - não é bom confiar apenas na capacidade do usuário de entender que o modal pode ser fechado ao clicar fora da tela

52 - Na tela de exercícios iniciantes para os pés, a top bar está com o texto cortado

53 - Na tela de exercícios iniciantes para os pés, a lista de exercícios vem com um aparente botão que não faz nada ao ser clicado; pode ser que ele não seja um botão, e nesse caso seria melhor removê-lo ou pelo menos alterar a aparência para que não pareça um botão; e se ele for mesmo um botão, não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

54 - No modal que é aberto após iniciar os exercícios iniciantes para os pés, ele está com um tamanho inadequado para a tela; não é possível rolar para baixo e aparece um possível componente com erro de renderização, com aparência de warning amarela e preta e uma frase "bottom overflowed by 132 pixels"; possivelmente é o botão de continuar, pois ele não está em lugar nenhum e, dessa forma, não é possível fazer os exercícios; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo

55 -  No modal que é aberto após iniciar os exercícios iniciantes para os pés, falta um botão de fechar

56 - Na tela de exercícios intermediários para os pés, a top bar está com o texto cortado

57 - Na tela de exercícios intermediários para os pés, a lista de exercícios vem com um aparente botão que não faz nada ao ser clicado; pode ser que ele não seja um botão, e nesse caso seria melhor removê-lo ou pelo menos alterar a aparência para que não pareça um botão; e se ele for mesmo um botão, não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

58 - No modal que é aberto após iniciar os exercícios intermediários para os pés, ele está com um tamanho inadequado para a tela; não é possível rolar para baixo e aparece um possível componente com erro de renderização, com aparência de warning amarela e preta e uma frase "bottom overflowed by 132 pixels"; possivelmente é o botão de continuar, pois ele não está em lugar nenhum e, dessa forma, não é possível fazer os exercícios; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo

59 -  No modal que é aberto após iniciar os exercícios intermediários para os pés, falta um botão de fechar

60 - Na tela de exercícios avançados para os pés, a top bar está com o texto cortado

61 - Na tela de exercícios avançados para os pés, a lista de exercícios vem com um aparente botão que não faz nada ao ser clicado; pode ser que ele não seja um botão, e nesse caso seria melhor removê-lo ou pelo menos alterar a aparência para que não pareça um botão; e se ele for mesmo um botão, não está funcionando ou não foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

62 - No modal que é aberto após iniciar os exercícios avançados para os pés, ele está com um tamanho inadequado para a tela; não é possível rolar para baixo e aparece um possível componente com erro de renderização, com aparência de warning amarela e preta e uma frase "bottom overflowed by 132 pixels"; possivelmente é o botão de continuar, pois ele não está em lugar nenhum e, dessa forma, não é possível fazer os exercícios; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo

63 -  No modal que é aberto após iniciar os exercícios avançados para os pés, falta um botão de fechar

64 - Na página de Relaxamento Guiado, a lista de vídeos exibe apenas um vídeo por vez, dificultando a rolagem para baixo

65 - A tela de exibição de vídeos na seção de Relaxamento Guiado está muito vazia, poderia ter um texto embaixo do vídeo explicando o que é aquele vídeo, assim a pessoa não precisa assistir se achar que não se encaixa no que ela precisa.

66 - Alguns vídeos da tela de exibição de vídeos na seção de Relaxamento Guiado não estão funcionando

67 - Na tela que aparece após selecionar Técnicas de Respiração na seção de relaxamento, o tamanho está inadequado para a tela; não é possível rolar para baixo e aparece um possível componente com erro de renderização, com aparência de warning amarela e preta e uma frase "bottom overflowed by 44 pixels"; possivelmente é o botão de continuar, pois ele não está em lugar nenhum e, dessa forma, não é possível continuar a atividade; do ponto de vista de uma boa experiência do usuário, esse tipo de ajuste não deve afetar a usabilidade do aplicativo

68 - Ao clicar botão "Informções sobre atividades físicas", aparece uma tela com explicações e alguns botões de informações ao longo do texto; nenhum deles está funcionando ou nenhum foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

69 - Na seção Informações, ao clicar na opção Artrites Reumatóides, há alguns botões de informações ao longo do texto; nenhum deles está funcionando ou nenhum foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

70 - Na seção Informações, ao clicar na opção Tratamentos, há alguns botões de informações ao longo do texto; nenhum deles está funcionando ou nenhum foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo; além disso, há alguns textos cortados e um possível componente com problema de renderização no lado esquerdo da tela - com aparência de warning, amarela e preta, e com o texto "Right overflowed by 58 pixels"; no fim dessa tela, há algumas referências mas nem todas possuem link; se isso for uma decisão consciente, considero aceitável

71 - Na seção Informações, ao clicar na opção Emocional, há alguns botões de informações ao longo do texto; nenhum deles está funcionando ou nenhum foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

72 - Na seção Informações, ao clicar na opção Exercício Físico, há alguns botões de informações ao longo do texto; nenhum deles está funcionando ou nenhum foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

73 - Na seção Informações, ao clicar na opção Leis e Direitos, há alguns botões de informações ao longo do texto; nenhum deles está funcionando ou nenhum foi implementado - em qualquer um dos casos, seria bom avisar o usuário de que algo deu errado ou que a feature não está pronta, com um toast por exemplo

74 - Na seção Informações, ao clicar na opção Mitos e Verdades, o tamanho da tela não está adequado, uma parte pequena do último card é cortada

75 - No gráfico da seção de Evolução, poderia ter legendas nos eixos da tabela

76 - Quando o usuário e/ou senha estão errados, não há nenhuma indicação para o usuário, seria bom um toast/alert avisando isso;