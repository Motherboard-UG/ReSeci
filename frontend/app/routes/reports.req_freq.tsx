import { useLoaderData } from "@remix-run/react";
import { json } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";
import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  LineElement,
  Title,
  Tooltip,
  Legend,
  PointElement,
} from 'chart.js';

export const loader = async () => {
  return json({
      requests: await jaseciCall("list_request",{}),
  });
}

export default function reportsRequestsFrequency() {

  const {requests} = useLoaderData();

  ChartJS.register(
    CategoryScale,
    LinearScale,
    LineElement,
    Title,
    Tooltip,
    Legend,
    PointElement
  );

  const graph_data:{ [key:number]:number } = arrangeDataByHour(requests);
  // graph_data = change_labels_from_data(graph_data);

  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'bottom' as const,
      },
      title: {
        display: true,
        text: 'Request Frequency (Today)',
      },
    },
  };

  const data = {
    // labels: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
    datasets: [
      {
        label: "Accepted Requests",
        data: graph_data,
        fill: true,
        backgroundColor: "rgba(0, 150, 47, 0.8)",
        borderColor: "rgba(0, 150, 47, 0.8)"
      }
    ]
  };

  return (
    <>
      <Line
        options={options}
        data={data}
      />
    </>
  )
}

function arrangeDataByHour(requests){
  var graph_data:{ [key:number]:number } = {};

  requests.report?.forEach( request => {
      var hour = getHourFromTimestamp(request.timestamp);
      console.log(hour);
      if (graph_data[hour] == undefined){
        graph_data[hour] = 1;
      } else {
        graph_data[hour] += 1;
      }
    });

  console.log(graph_data);

  return graph_data;
}

function getHourFromTimestamp(timestamp){
  const temp = new Date(timestamp);
  return temp.getHours();
}
