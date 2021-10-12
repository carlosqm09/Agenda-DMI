const { Router } = require('express');
const router = Router();

const { getContacts, getContactByName, createContact, updateContact, deleteContact,getUsers, createUser, updateUser, deleteUser } = require('../controllers/index.controller');

router.get('/contacts', getContacts);
router.get('/users', getUsers);
router.get('/contacts/:nombre', getContactByName);
router.post('/contacts', createContact);
router.post('/users', createUser);
router.put('/contacts/:id', updateContact)
router.put('/users/:id', updateUser)
router.delete('/contacts/:id', deleteContact);
router.delete('/users/:id', deleteUser);

module.exports = router;