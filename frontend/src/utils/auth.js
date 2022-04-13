import jwt_decode from 'jwt-decode';
import axios from 'axios';

export const authenticate = (token, cb) => {
    if (typeof window !== 'undefined') {
       
        localStorage.setItem('jwt', JSON.stringify(token.data.access_token));
        localStorage.setItem('user', JSON.stringify(token.data.user));
        cb();
    }
}

export const isAuthenticated = () => {
    if (typeof window === 'undefined') return false;

    if (localStorage.getItem('jwt') && localStorage.getItem('jwt') !== 'undefined'){

        const { exp } = jwt_decode(JSON.parse(localStorage.getItem('jwt')));

        if ((new Date()).getTime() <= exp * 1000) {
            return true;
        } else {
            localStorage.removeItem('jwt');
            return false
        }

    } else return false;
}

export const userInfo = () => {
    const user = JSON.parse(localStorage.getItem('user'));
   // console.log(user)
    //const decoded = jwt_decode(user);
    return { user: user }
}


export const token = () => {

  const token = localStorage.getItem('jwt');
  return { token: token }
   
}


export const singout = cb => {
    if (typeof window !== 'undefined') {
        localStorage.removeItem('jwt');
        localStorage.removeItem('user');
        cb();
    }
}










