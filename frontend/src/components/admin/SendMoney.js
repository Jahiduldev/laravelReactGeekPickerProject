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
        currencyType: user.CurrencyType,
        error: false,
        success: false,
        loading: false
    });

   
    const {name, customerSenderId, customerSenderAccNo, customerReceiverAccNo, amount, currencyType, redirect, error, success, loading } = values;

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
      
        createSendMoney(token, {customerSenderId, name, customerSenderAccNo, customerReceiverAccNo ,amount ,currencyType })
            .then(response => {
                
                setValues({
                    name: '',
                    accountsNumber: '',
                    amount: '',
                    currencyType: user.CurrencyType,
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

    // const goBack = () => (<div className="mt-5">
    //     <Link to="/dashboard" className="text-warning">Go to Dashboard</Link>
    // </div>)

    const redirectUser = () => {
        if (redirect) return <Redirect to="/dashboard" />
    }


    return (
        <Layout title="Add a new category">
            <div className="row">
                <div className="col-md-8 offset-md-2">
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




