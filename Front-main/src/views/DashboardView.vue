<template>
 <div class="dashboard">
    <div class="welcome ">
        <WelcomeMessage />
    </div>
    
    
    <TaskOverview :taskCount="taskCount" />

    <div class="container">
        <div class="row">
        <!-- TodayTasks Component -->
            <div class="col-11 col-lg-6 d-flex justify-content-center ms-5 ms-md-0">
                <TodayTasks :tasks="tasksArray" />
            </div>

          
          <div class="col-11 col-lg-6 d-flex justify-content-center ms-5 ms-md-0 ">
             <PieChart  :statistics="taskStatistics" class="dashboard-pie-chart" />
         </div>
           
    </div>
     
    <div class="row">
       
        <div class="col-12 col-md-12">
            <TaskBoard /> 
        </div>
    </div>
  </div>
  </div>
</template>

<script>
import WelcomeMessage from '@/components/WelcomeMessage.vue';
import TaskOverview from '@/components/TaskOverview.vue';
import TodayTasks from '@/components/TodayTasks.vue';
import TaskBoard from '@/components/TaskBoard.vue';
import PieChart from "@/components/charts/PieChart.vue";
import axios from 'axios';
axios.defaults.withCredentials = true; // Assure que les cookies de session sont envoyés
export default {

    name: 'DashboardView',
    components: { TaskOverview, TodayTasks, WelcomeMessage,TaskBoard, PieChart,  },
    data() {
        return {
            show: false,
            taskCount: 0, // Default task count
            taskStatistics: [],
        };
    },
    methods: {
    async fetchStatistics() {
      try {
        const response = await axios.get("http://localhost:3000/api/statistiques", { withCredentials: true });
        this.taskStatistics = response.data || [];
      } catch (error) {
        console.error("Erreur lors du chargement des statistiques :", error);
      }
    },

    },

 
    mounted() {
    // Fetch task count
    axios
        .get('http://localhost:3000/api/tasks/today', {
            withCredentials: true 
        })
        .then((response) => {
            this.taskCount = response.data.taskCount; // Assign the fetched count
        })
        .catch((error) => {
            console.error('Error fetching task count:', error);
        });
        this.fetchStatistics();
},
};

</script>

<style>



</style>
