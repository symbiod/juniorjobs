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
	  				id: tag.name
	  				name: tag.name	
	  			}
  			)
  		}
  	cache: true
  }
  createTag: (params) ->
    {
      id: params.term
      name: params.term
    }
  tags: true
  minimumInputLength: 2
  tokenSeparators: [',']
  templateResult: (item) -> item.name
  templateSelection: (item) ->  item.name
  
    

