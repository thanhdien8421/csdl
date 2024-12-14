// "use client";
// import { Chart } from 'primereact/chart';
// import axios from 'axios';
// const RevenueChart = () => {
//     const [chartData, setChartData] = useState({});

//     const data = {  
//         labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],  
//         datasets: [  
//             {  
//                 label: 'Revenue',  
//                 data: [65, 59, 80, 81, 56, 55, 40],  
//                 fill: false,  
//                 borderColor: 'rgb(75, 192, 192)',  
//                 tension: 0.1  
//             }  
//         ]  
//     };  
//     const options = {  
//         scales: {  
//             y: {  
//                 beginAtZero: true  
//             }  
//         }  
//     };  
//     return (  
//         <Chart type="line" data={data} options={options} />  
//     );  
// };  
// export default RevenueChart;
'use client';

import { useState, useEffect } from 'react';
import { Chart } from 'primereact/chart';
import axios from 'axios';

interface RevenueData {
    Year: number;
    Month: number;
    TotalRevenue: number;
}

const RevenueChart = () => {
    const [chartData, setChartData] = useState<{
        labels: string[];
        datasets: { label: string; data: number[]; fill: boolean; borderColor: string; tension: number }[];
    }>({ labels: [], datasets: [] });
    const [storeId, setStoreId] = useState<number>(1);  // ID của cửa hàng mặc định là 1
    const [loading, setLoading] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);  // Thêm trạng thái lỗi

    useEffect(() => {
        const fetchData = async () => {
            setLoading(true);
            try {
                const response = await axios.get(`http://localhost:8000/api/revenue?id=${storeId}`);
                if (response.data.statusCode === 200) {
                    const data: RevenueData[] = response.data.data;
                    const months = [
                        'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 
                        'September', 'October', 'November', 'December'
                    ];

                    const totalRevenue = new Array(12).fill(0);  // Khởi tạo mảng doanh thu cho tất cả các tháng

                    data.forEach((item) => {
                        const monthIndex = item.Month - 1;  // Tháng bắt đầu từ 1, nên giảm đi 1 để khớp với chỉ số mảng
                        totalRevenue[monthIndex] = item.TotalRevenue;
                    });

                    setChartData({
                        labels: months,
                        datasets: [
                            {
                                label: 'Revenue',
                                data: totalRevenue,
                                fill: false,
                                borderColor: 'rgb(75, 192, 192)',
                                tension: 0.1
                            }
                        ]
                    });
                } else {
                    setError('Error fetching revenue data');
                    console.error('Error fetching revenue data');
                }
            } catch (error) {
                setError('Error fetching revenue data');
                console.error('Error fetching revenue data:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [storeId]);  // Gọi lại khi storeId thay đổi

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const value = parseInt(e.target.value);
        if (!isNaN(value)) {
            setStoreId(value);
        }
    };

    const options = {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    };

    return (
        <div>
            <h2>Hãy nhập id cửa hàng:</h2>
            <input
                type="number"
                value={storeId}
                onChange={handleChange}
                placeholder="Enter store ID"
                className="border p-2 mb-4"
            />
            {loading && <p>Loading...</p>}
            {error && <p style={{ color: 'red' }}>{error}</p>} {/* Hiển thị lỗi nếu có */}
            <div> Revenue of store: {storeId}</div>
            <Chart type="line" data={chartData} options={options} />
        </div>
    );
};

export default RevenueChart;
