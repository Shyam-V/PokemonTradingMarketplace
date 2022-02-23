const firebase = require('firebase')
require('firebase/firestore')

var base1 = require('../python-scripts/base1_filtered.json');

firebase.initializeApp({
    apiKey: "AIzaSyCJLx_zhOilahICkOcXkcs7os1VQ6yL6Yc",
    authDomain: "pokemon-trading.firebaseapp.com",
    projectId: "pokemon-trading",
    storageBucket: "pokemon-trading.appspot.com",
    messagingSenderId: "403625512513",
    appId: "1:403625512513:web:6f7fae1df9caff7316c0c0",
    measurementId: "G-HGRDFSLTNK"
})

var db = firebase.firestore()


base1.forEach(function(obj){

    db.collection("Cards").add({
                id: obj.id,
                name: obj.name,
                supertype: obj.supertype,
                artst: obj.artist,
                images: obj.images
                })
})
console.log("Records added")