this.Select2Initializer = (function() {
  function Select2Initializer(formEl) {
    this.formElement = formEl;
    var self = this;
    this.bindSelect2Listener(this.formElement);
  }    
  
  Select2Initializer.prototype.bindSelect2Listener = function(el){
    $(el).select2({
      ajax: {
        url: '/tags',
        dataType: 'json',
        quietMillis: 250,
        processResults: function(data, params) {
          return {
            results: _.map(data, function(tag) {
              return {
                id: tag.name,
                name: tag.name
              };
            })
          };
        },
        cache: true
      },
      createTag: function(params) {
        return {
          id: params.term,
          name: params.term
        };
      },
      tags: true,
      minimumInputLength: 2,
      tokenSeparators: [','],
      templateResult: function(item) {
        return item.name;
      },
      templateSelection: function(item) {
        return item.name;
      }
    });
  };

    return Select2Initializer;
  
})();


$(function() {
  return new Select2Initializer();
});