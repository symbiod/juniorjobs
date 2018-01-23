$("#job_tag_list").select2
  ajax: {
  	url: '/tags'
  	data: (params) -> 
  		{
  			term: params.term
  		}
  	dataType: 'json'
  	quietMillis: 250
  	processResults: (data, params) ->
  		{
  			results: _.map(data, (tag) ->
	  			{
	  				id: tag.id
	  				name: tag.name	
	  			}
  			)
  		}
  	cache: true	
  }
  tags: true
  escapeMarkup: (markup) -> markup
  minimumInputLength: 2
  tokenSeparators: [',']
  templateResult: (item) -> item.name
  templateSelection: (item) -> item.name

