import React, { useState } from 'react';
import Layout from '../Layout';
import { Redirect } from 'react-router-dom';
import { showError, showSuccess, showLoading } from '../../utils/messages';
import { Link } from 'react-router-dom';
import { createSendMoney } from '../../api/apiTransaction';
import { userInfo } from '../../utils/auth';

const SendMoney = () => {
    
    const  { user }   = userInfo();
    
    const [values, setValues] = useState({
        name: '',
        customerSenderId: user.id,
        customerSenderAccNo: user.accountsNumber,
        customerReceiverAccNo: '',
        amount: '',
        CurrencyCode: user.CurrencyCode,
        error: false,
        success: false,
        loading: false
    });

    const {name, customerSenderId, customerSenderAccNo, customerReceiverAccNo, amount, CurrencyCode, redirect, error, success, loading } = values;

    const handleChange = (e) => {
        setValues({
            ...values,
            error: false,
            [e.target.name]: e.target.value,
            error: false,
            redirect: false
        })
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        setValues({
            ...values, loading: true, error: false, success: false
        });

        const { token } = userInfo();
      
        createSendMoney(token, {customerSenderId, name, customerSenderAccNo, customerReceiverAccNo ,amount ,CurrencyCode })
            .then(response => {
                
                setValues({
                    ...values,
                    error: false,
                    success: true,
                    loading: false,
                    redirect: true
                })
            })
            .catch(err => {
                if (err.response) setValues({
                    ...values,
                    success: false,
                    error: 'err.response.data',
                    loading: false
                })
                else setValues({
                    ...values,
                    success: false,
                    error: "Something went wrong!",
                    loading: false
                })
            })
    }

 
    const sendMoneyForm = () => {
        return (
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label className="text-muted">Name</label>
                    <input
                        name="name"
                        type="text"
                        onChange={handleChange}
                        value={name}
                        autoFocus
                        required
                        className="form-control"
                        placeholder="john doe"
                    />
                </div>
                 
                <div className="form-group">
                    <label className="text-muted">Accounting Number:</label>
                    <input
                        name="customerReceiverAccNo"
                        type="text"
                        onChange={handleChange}
                        value={customerReceiverAccNo}
                        autoFocus
                        required
                        className="form-control"
                        placeholder="account number"
                    />
                </div>
                <div className="form-group">
                    <label className="text-muted">Amount:</label>
                    <input
                        name="amount"
                        type="text"
                        onChange={handleChange}
                        value={amount}
                        autoFocus
                        required
                        className="form-control"
                        placeholder="0.00"
                    />
                </div>
                <button type="submit" className="btn btn-outline-primary">Send</button>
            </form>
        )
    }

    
    const UserLinks = () => {
        return (
            <div className="card">
                <h4 className="card-header">User Links</h4>
                <ul className="list-group">
                    <li className="list-group-item">
                        <Link className="nav-link" to="/sendMoney">Send Money</Link>
                    </li>
                    <li className="list-group-item">
                        <Link className="nav-link" to="/transactionReport">Transaction Report</Link>
                    </li>
                </ul>
            </div>
        )
    };

    const redirectUser = () => {
        if (redirect) return <Redirect to="/dashboard" />
    }


    return (
        <Layout title="Send Money">
            <div className="row">
                <div className="col-sm-3">
                    <UserLinks />
                </div>
                <div className="col-md-7">
                    {redirectUser()}
                    {showLoading(loading)}
                    {showError(error, error)}
                    {showSuccess(success, 'Money has been send!')}
                    {sendMoneyForm()}
                </div>
            </div>
        </Layout>
    );
}
export default SendMoney;




