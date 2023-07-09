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
      persons: await jaseciCall("list_persons",{}),
  });
}

export default function reportsRequestsFrequency() {

  ChartJS.register(
    CategoryScale,
    LinearScale,
    LineElement,
    Title,
    Tooltip,
    Legend,
    PointElement
  );

  // const ages:Array<number> = get_ages();
  // const avg_age:number = get_avg_age(ages);
  // var graph_data:{ [key:number]:number } = create_graph_data(ages);
  // graph_data = change_labels_from_data(graph_data);

  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'bottom' as const,
      },
      title: {
        display: true,
        text: 'Request Frequency',
      },
    },
  };

  const data = {
    labels: [1,2,3,4,5],
    datasets: [
      {
        label: "Accepted Requests",
        data: [23,21,22,31,32],
        fill: true,
        backgroundColor: "rgba(0, 150, 47, 0.8)",
        borderColor: "rgba(0, 150, 47, 0.8)"
      },
      {
        label: "Blocked Requests",
        data: [1,3,2,1,1],
        fill: true,
        backgroundColor: "rgba(245, 39, 86, 0.8)",
        borderColor: "rgba(245, 39, 86, 0.8)"
      },
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
