<script>
import { Doughnut } from 'vue-chartjs'

const responseConfig = [
  { type: "very_disappointed", label: "Very disapointed" },
  { type: "semi_disappointed", label: "Semi disappointed" },
  { type: "not_disappointed", label: "Not disapointed" }
];

const responseLabels = responseConfig.map(resType => resType.label);

export default {
  extends: Doughnut,
  props: ["responses", "currentSegment"],
  data() {
    const self = this;
    return {
      chartdata: {
        datasets: [{
          data: this.formattedResponseCounts(),
          backgroundColor: ["#ffcd56", "#36a2eb", "#ff6384"],
          label: "Product market fit"
        }],
        labels: responseLabels
      },
      chartoptions: {
        responsive: false,
        onClick: function(evt, f) {
          const dataIndex = f[0]._chart.tooltip._active[0]._index;
          const segment = responseConfig[dataIndex];
          self.$emit('update:current-segment', segment)
        }
      }
    }
  },
  methods: {
    formattedResponseCounts: function() {
      return responseConfig.map(responseType => {
        return this.formattedResponseCount(responseType.type)
      });
    },
    formattedResponseCount: function(type) {
      if(this.responses && this.responses[type]) {
        return this.responses[type].length
      } else {
        return 0;
      }
    }
  },
  mounted () {
    this.renderChart(this.chartdata, this.chartoptions)
  }
}
</script>
