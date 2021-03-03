fprintf("P('sequência um dois') = 1/9 -> 1 caso favorável em 3*3 = 9 casos prováveis");
fprintf("\n\nP('um ocorrer pelo menos uma vez') = 5/9 -> 1*2 + 2*1 + 1*1 = 5 casos favoráveis em 9 casos prováveis");
fprintf("\n\nP('ocorrer um ou dois numa sequência') = P('um' U 'dois) = P('um') + P('dois') - P('um' e 'dois)");
fprintf("\nP('um' U 'dois') = 5/9 + 5/9 - 2/9 = 8/9 ");
fprintf("\nEsta probabilidade também é igual a 1 - P('sequência três três') = 1 - 1/9 = 8/9 ");
fprintf("\n\nP[A = 'sequência incluir a palavra um'| B = 'sequência inclui palavra dois'] = P(AB)/P(B)");
fprintf("\nP(A|B) = P(AB) / P(B) = (2/9) / (5/9) = 2/5");
