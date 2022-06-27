(async () => {
    AtividadeProjeto.findAll({
        attributes: ['Cod_projeto', 'Cod_atividade']
      });
})()