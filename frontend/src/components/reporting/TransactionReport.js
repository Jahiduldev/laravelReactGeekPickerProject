import Layout from '../Layout';
import { Link } from 'react-router-dom';
import { useState , useEffect } from 'react';
import { transactionReport } from '../../api/apiReport';


const TransactionReport = () => {

    const [getData,setData] = useState('');
 
    useEffect(()=>{

        transactionReport()
        .then(res=>{
            setData(res.data);
            //console.log(res.data);
        })
        .catch(err=>{
            //console.log(err);
        })
        
    },[])


    const UserInfo = () => (
        <div className="card mb-5">
            <h3 className="card-header">Transaction Report</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">sl</th>
                        <th scope="col">TransactionNo</th>
                        <th scope="col">FromAccount</th>
                        <th scope="col">ToAccount</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Account Type</th>
                        <th scope="col">Date</th>
                    </tr>
                </thead>
                <tbody>
                {getData && getData.map(row => {
                    return(
                        <tr>
                            <th key={row.id}>{row.id}</th>
                            <td>{row.TransactionNo}</td>
                            <td>{row.TransactionNo}</td>
                            <td>{row.TransactionNo}</td>
                            <td>{row.CurrencyCode == 0 ? "$" : "€"} {row.Amount}</td>
                            <td>{row.TransactionTypeName}</td>
                            <td>{row.created_at}</td>
                        </tr>
                    );
                })}    
                </tbody>
            </table>
        </div>
    );

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

    return (

        <Layout title="Dashboard" className="container-fluid">
            <div className="row">
                <div className="col-sm-3">
                <UserLinks/>
                </div>
                <div className="col-sm-9">
                    <UserInfo/>
                </div>
            </div>
        </Layout>
    )

}

export default TransactionReport;