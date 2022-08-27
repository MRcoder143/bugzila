import $ from 'jquery'
require("select2")



  $('#bug_project_id').select2({
    placeholder: 'select a project',
    ajax: {
      url: '/livesearch',
      type: 'get',
      dataType: 'json',
      data: function (params) {
        var query = {
          search: params.term

        }
        return query;
      },
      processResults: function (data) {
        // Transforms the top-level key of the response object from 'items' to 'results'

        return {
          results: $.map(data, function(value){
             return {id: value.id, text: value.title};
           })
        };
      },
      cashe: 'true'
    }



  });
