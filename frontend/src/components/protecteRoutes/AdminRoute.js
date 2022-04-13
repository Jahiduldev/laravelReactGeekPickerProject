import { Route, Redirect } from 'react-router-dom';
import { isAuthenticated, userInfo } from '../../utils/auth';

const AdminRoute = ({ children, ...rest }) => {
   // const {user} = userInfo();
    return (
        <Route
            {...rest}
            render={({ location }) =>
                isAuthenticated() &&  userInfo().user.role==='admin' ?(
                    children
                ) : (
                    <Redirect
                        to={{
                            pathname: "/",
                            state: { from: location }
                        }}
                    />
                )
            }
        />
    );
}

export default AdminRoute;