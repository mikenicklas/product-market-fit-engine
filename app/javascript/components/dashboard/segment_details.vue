<template>
  <div>
    <h1>{{currentSegment.label}}</h1>
    <button class="btn btn-primary" v-on:click="$emit('update:current-segment', null)">View all segments</button>
  </div>
</template>

<script>
export default {
  props: ["current-segment"]
}
</script>
