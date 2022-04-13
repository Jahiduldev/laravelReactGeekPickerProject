import Layout from '../Layout';
import { Link } from 'react-router-dom';
import { useState , useEffect } from 'react';
import { totalAmountOFConversionForParticularUser } from '../../api/apiReport';

const TotalConversionForParticularuser = () => {
    

    const [usertData,setParticularUsertData] = useState('');
 
    useEffect(()=>{

        totalAmountOFConversionForParticularUser()
        .then(res=>{
            setParticularUsertData(res.data);
            console.log(res);
        })
        .catch(err=>{
            //console.log(err);
        })
        
    },[])


    const UserInfo = () => (
        <div className="card mb-5">
            <h3 className="card-header">Total Transaction by account number Report</h3>
            <table className="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">sl</th>
                        <th scope="col">Account Number</th>
                        <th scope="col">Amount</th>
                    </tr>
                </thead>
                <tbody>
                
                { usertData&&Object.entries(usertData).map( ([accNumber,amount],index) => {
                    return(
                        <tr> 
                            <td>{index}</td>
                            <td>{accNumber}</td>
                            <td>{amount}</td>
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
                        <Link className="nav-link" to="/totalConversionForParticularUser">Transaction Report</Link>
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
    );
}

export default TotalConversionForParticularuser;