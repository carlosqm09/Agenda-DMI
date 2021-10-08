const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all
router.get('/', (req, res) => {
  mysqlConnection.query('SELECT * FROM Contactos', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An 
router.get('/:nombre', (req, res) => {

  const { nombre } = req.params;
  

  mysqlConnection.query('SELECT * FROM Contactos WHERE nombre = ?', [nombre], (err, rows, fields) => {

    if (!err) {

      res.json(rows[0]);

    } else {

      console.log(err);

    }
  });
});

// DELETE An 
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM Contactos WHERE id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Contactos Borrados'});
    } else {
      console.log(err);
    }
  });
});

router.post('/', (req, res) => {
  const datos = req.body;
  mysqlConnection.query('INSERT INTO Contactos set ?', [datos], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Contactos Agregado'});
    } else {
      console.log(err);
    }
  });
});


router.put('/:id', (req, res) => {
  const { id } = req.params;
  const datos = req.body;
  mysqlConnection.query('Update Contactos set ? where id = ?', [datos, id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Contactos Actualizados'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;
