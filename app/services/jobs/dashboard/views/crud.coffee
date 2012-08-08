module.exports = (agent, el) ->
  if el.type is 'Collection'
    console.log el.model + "List"
  else
    console.log 'scoffold for model'