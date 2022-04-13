import Layout from '../Layout';
import { Link } from 'react-router-dom';
import { userInfo } from '../../utils/auth';
import { SendMoney } from '../admin/SendMoney';

const AdminDashBoard = (props) => {
    const { user } = userInfo();

  
    const CurrencyCode = user.CurrencyCode == 0 ? "$" : "€";

    const UserLinks = () => {
        return (
            <div className="card">
                <h4 className="card-header">Admin Dashboard</h4>
                <ul className="list-group">
                    <li className="list-group-item">
                        <Link className="nav-link" to="/totalConversionForParticularUser">Total amount of conversion for particular user</Link>
                    </li>
                    <li className="list-group-item">
                        <Link className="nav-link" to="/transactionReport">Most used conversion user</Link>
                    </li>
                </ul>
            </div>
        )
    };
    

    const PurchaseHistory = () => (
        <div className="card mb-5">
            <h3 className="card-header">Transaction History</h3>
            <ul className="list-group">
                <li className="list-group-item">Total Conversion Amount:</li>
                <li className="list-group-item">Third highest Amount of Transaction:</li>
            </ul>
        </div>
    );

    const UserInfo = () => (
        <div className="card mb-5">
            <h3 className="card-header">Account Information</h3>
            <ul className="list-group">
                <li className="list-group-item">Name: {user.name}</li>
                <li className="list-group-item">Email: {user.email}</li>
                <li className="list-group-item">Balance: {CurrencyCode} {user.CurrentBalance}
                
                </li>
            </ul>
        </div>
    );

    return (
        <Layout title="Dashboard" className="container-fluid">
            <div className="row">
                <div className="col-sm-3">
                    <UserLinks />
                </div>
                <div className="col-sm-9">
                    <UserInfo />
                    <PurchaseHistory />
                </div>
            </div>
        </Layout>
    )
}

export default AdminDashBoard;