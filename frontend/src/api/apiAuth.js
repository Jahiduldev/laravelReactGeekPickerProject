import axios from 'axios';
import { API } from '../utils/config';

export const register = (user) => {
    return axios.post(`http://localhost:8000/api/signup`, user, {
        headers: {
            'Content-Type': 'application/json'
        }
    })
};

export const login = (user) => {
    // console.log(user);
    return axios.post(`http://localhost:8000/api/login`, user, {
        headers: {
            'Content-Type': 'application/json'
        }
    })
};