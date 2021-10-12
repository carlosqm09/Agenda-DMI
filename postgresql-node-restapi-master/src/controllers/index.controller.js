
const { Pool } = require('pg');

const pool = new Pool({
    user: 'utm2021',
    host: 'postgresql-53522-0.cloudclusters.net',
    password: 'agenda2021',
    database: 'agenda20',
    port: '19917'
  });


const getContacts = async (req, res) => {
    const response = await pool.query('SELECT * FROM public.contacts');
    res.status(200).json(response.rows);
};

const getContactByName = async (req, res) => {
    const nombre = req.params.nombre;
    const response = await pool.query('SELECT * FROM public.contacts WHERE nombre = $1', [nombre]);
    res.json(response.rows);
};

const createContact = async (req, res) => {
    const { nombre, apellido, telefono, email, user_id } = req.body;
    const response = await pool.query('INSERT INTO public.contacts VALUES (DEFAULT, $1, $2, $3, $4, $5)', [nombre, apellido, telefono, email, user_id]);
    res.json({
        message: 'Contact Added successfully',
        body: {
            user: {nombre, apellido, telefono, email, user_id}
        }
    })
};


const updateContact = async (req, res) => {
    const id = parseInt(req.params.id);
    const { nombre, apellido, telefono, email, user_id } = req.body;

    const response =await pool.query('UPDATE public.contacts SET nombre = $1, apellido = $2, telefono = $3, email = $4, user_id = $5 WHERE id = $6', [
        nombre, apellido, telefono, email, user_id, id
    ]);
    res.json('Contact Updated Successfully');
};

const deleteContact = async (req, res) => {
    const id = parseInt(req.params.id);
    await pool.query('DELETE FROM public.contacts where id = $1', [
        id
    ]);
    res.json(`Contact ${id} deleted Successfully`);
};


//USERSSSSSSSSSSSSSSSSSSSSSSSSSSSS
const getUsers = async (req, res) => {
    const response = await pool.query('SELECT * FROM public.users');
    res.status(200).json(response.rows);
};

const createUser = async (req, res) => {
    const { nombre, correo } = req.body;
    const response = await pool.query('INSERT INTO public.users VALUES (DEFAULT, $1, $2)', [correo, nombre]);
    res.json({
        message: 'User Added successfully',
        body: {
            user: {correo, nombre}
        }
    })
};

const updateUser = async (req, res) => {
    const id = req.params.id;
    const { nombre, correo } = req.body;

    const response =await pool.query('UPDATE public.users SET nombre = $1, correo = $2 WHERE id = $3', [
        nombre, correo, id
    ]);
    res.json('User Updated Successfully');
};

const deleteUser = async (req, res) => {
    const id = parseInt(req.params.id);
    await pool.query('DELETE FROM public.users where id = $1', [
        id
    ]);
    res.json(`User ${id} deleted Successfully`);
};



module.exports = {
    getContacts,
    getContactByName,
    createContact,
    updateContact,
    deleteContact,
    getUsers,
    createUser,
    updateUser,
    deleteUser
};