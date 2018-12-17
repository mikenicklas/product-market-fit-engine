<template>
  <div class="row">
    <div class="col-sm-4 text-center">
      <div class="card">
        <h1 class="score">{{score}}</h1>
        <p class="score__title">Product Market Fit Score</p>
      </div>

      <div class="card u-mt--2">
        <ResponsePieChart
          :current-segment="currentSegment"
          :responses="responses"
          :height="280"
          :width="280"
          :styles="{display: 'inline-block'}"
          @update:current-segment="currentSegment = $event"
        />
      </div>
    </div>
    <div class="col-sm-8">
      <div class="card">
        <SegmentDetails v-if="currentSegment"
          :currentSegment="currentSegment"
          @update:current-segment="currentSegment = $event"
        />
      </div>
    </div>
  </div>
</template>

<script>
import ResponsePieChart from "./components/dashboard/response_pie_chart.vue";
import SegmentDetails from "./components/dashboard/segment_details.vue";

export default {
  components: {
    ResponsePieChart,
    SegmentDetails
  },
  data() {
    return {
      responses: window.surveyResponses,
      currentSegment: {type: "very_disappointed", label: "Very disappointed"}
    }
  },
  computed: {
    score() {
      const r = this.responses;
      const very = r.very_disappointed.length;
      const semi = r.semi_disappointed.length;
      const not = r.not_disappointed.length;
      return Math.floor(very / (very + semi + not) * 100)
    }
  }
}
</script>

<style scoped>
  .score {
    border-radius: 100px;
    height: 100px;
    width: 100px;
    border: 5px solid #333;
    text-align: center;
    margin: 0 auto 24px auto;
    line-height: 95px;
  }

  .score__title {
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
  }
</style>
