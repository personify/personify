module.exports = (views, val, key) ->

    if typeof(val) is 'string'
      views[key] = { "_desc": val }
    else if typeof(val) is 'object'
      views[key] = val
    return views
