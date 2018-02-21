###
  Execution List
  ==============
  Lists a series of runs, their outputs, and the units of those outputs
###
Vue.component 'exec-list',
  props:
    data: Array
    unit: String
  template: '
    <ul>
        <li v-for="(item, index) in data">
          <span>{{numeral(index + 1).format(\'0o\')}} run</span>
          <div class="pull-right">{{item}} {{unit}}</div>
        </li>
    </ul>
  '

###
  Test Step Component
  ===================
  Represents a "step" of a given test case
###
Vue.component 'test-step',
  props:
    test_step: Object
  template: '
    <div class="test-step" v-on:click="showInfo">
      <img :src="\'/img/\' + test_step.screenshot" />
      <h3>{{test_step.step_name}}</h3>
    </div>
  '
  methods:
    showInfo: () ->
      this.$emit('show')

###
  Test Case Component
  ===================
  Represents a collection of test steps, the composite of which represent a user action in the app
###
Vue.component 'test-case',
  props:
    test_case: Object
  methods:
    showInfo: (test_step, index) -> this.$emit('show', {step: test_step, index: index})
  template: '
    <div class="test-case">
      <div class="header">
        <div class="status" :class="{ passed: test_case.status === true, failed: test_case.status === false }"></div>
        <div class="text">
          <h2>{{test_case.test_name}}</h2>
          <span class="steps-count">{{test_case.test_steps.length}} Steps</span>
          <span class="separator" />
          <span v-if="test_case.status === true" class="status passed">Passed</span>
          <span v-else-if="test_case.status === false" class="status failed">Failed</span>
          <span v-else class="status">Not Run</span>
        </div>
      </div>
      <div class="steps">
        <test-step v-for="(test_step, index) in test_case.test_steps"
                   @show="showInfo(test_step, index)"
                   :test_step="test_step"
                   :index="index"
                   :key="index"
        />
      </div>
    </div>
  '