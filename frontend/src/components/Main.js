import { Switch, Route, Redirect } from 'react-router-dom';
import PrivateRoute from '../components/protecteRoutes/PrivateRoute';
import Home from './home/Home';
import Login from './user/Login';
import Register from './user/Register';
import Dashboard from './user/Dashboard';
import SendMoney from './admin/SendMoney';
import TransactionReport from './reporting/TransactionReport';

const Main = () => {
    return (
        <div>
            <Switch>
                <Route path="/" exact component={Home} />
                <Route path="/login" exact component={Login} />
                <Route path="/register" exact component={Register} />
                <Route path="/transactionReport" exact component={TransactionReport} />
                <PrivateRoute path="/dashboard">
                    <Dashboard />
                </PrivateRoute>
                <PrivateRoute path="/sendMoney">
                    <SendMoney />
                </PrivateRoute>
            
            </Switch>
        </div>
    )
}


export default Main;