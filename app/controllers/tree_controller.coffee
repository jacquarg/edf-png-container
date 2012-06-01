load 'application'
tree = require('../../lib/tree')





action 'create', ->
    note = new Note body
    Note.create note, (err, note) =>
        if err
            send error: 'Note can not be created'
        else
            send note, 201

action 'show', ->
    send @note, 200

action 'update', ->
    note = new Note body
    @note.updateAttributes note, (err) =>
        if !err
            send success: 'Note updated'
        else
            console.log err
            send error: 'Note can not be updated', 400

action 'destroy', ->
    @note.destroy (err) ->
        if err
            send error: 'Can not destroy note', 500
        else
            send success: 'Note succesfuly deleted'

action 'all', ->
    Note.all (err, notes) ->
        if err
            send error: "Retrieve notes failed.", 500
        else
            send length: notes.length, rows: notes


