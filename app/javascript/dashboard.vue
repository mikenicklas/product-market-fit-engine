<template>
  <div class="text-center u-mt--4">
    <SegmentDetails v-if="currentSegment"
      :currentSegment="currentSegment"
      @update:current-segment="currentSegment = $event"
    />
    <ResponsePieChart v-else
      :current-segment="currentSegment"
      :responses="responses"
      :height="400"
      :width="400"
      :styles="{display: 'inline-block'}"
      @update:current-segment="currentSegment = $event"
    />
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
      currentSegment: null
    }
  }
}
</script>
