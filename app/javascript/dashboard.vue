<template>
  <div class="text-center u-mt--4">
    <ResponsePieChart :responses="responses" :height="400" :width="400" :styles="{display: 'inline-block'}"/>
  </div>
</template>

<script>
import ResponsePieChart from "./components/dashboard/response_pie_chart.vue";

export default {
  components: {
    ResponsePieChart
  },
  data() {
    return {
      responses: window.surveyResponses
    }
  }
}
</script>
