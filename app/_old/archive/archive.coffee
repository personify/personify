module.exports = (archive, val, key) ->

    if typeof(val) is 'string'
      archive[key] = [] 
      #TODO: implement types
      #archive[key] = factory val # factory(type)
    else if typeof(val) is 'object'
      archive[key] = val

    return archive
