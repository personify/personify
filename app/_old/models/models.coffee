module.exports = (models, val, key) ->

    if typeof(val) is 'string'
      models[key] = {'_desc': val}
    else if typeof(val) is 'object'
      models[key] = val
      # TODO: ad support for meta props
    return models