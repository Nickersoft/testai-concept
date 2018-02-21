# Initialize a new Vue instance
v = new Vue
  el: '#app'
  data:
    loading: true
    id: null
    name: null
    launch_times: [100, 200],
    memory: [100,200],
    cpu: [100,200]
    timestamp: null,
    screenshot: null,
    show_sidebar: false,
    step_name: null,
    step_index: -1,
    test_cases: []
  methods:
    setCPU: (cpu) -> this.cpu = cpu
    setID: (id) -> this.id = id
    setLaunchTimes: (times) -> this.launch_times = times
    setLoading: (loading) -> this.loading = loading
    setMemory: (memory) -> this.memory = memory
    setName: (name) -> this.name = name
    setScreenshot: (screenshot) -> this.screenshot = screenshot
    showSidebar: () -> this.show_sidebar = true
    setStepIndex: (index) -> this.step_index = index
    setStepName: (step_name) -> this.step_name = step_name
    setTimestamp: (timestamp) -> this.timestamp = timestamp
    setTestCases: (test_cases) -> this.test_cases = test_cases
    showInfo: (test_step) ->
      { step, index } = test_step
      { cpu, launch_times, memory, screenshot, step_name } = step

      this.setCPU(cpu)
      this.setMemory(memory)
      this.setLaunchTimes(launch_times)
      this.setScreenshot(screenshot)
      this.setStepIndex(index)
      this.setStepName(step_name)
      this.showSidebar();

# Retrieve the data from the server
# Obviously in production this would be a real API endpoint
fetch '/data',
  method: 'POST',
  headers:
    'Content-Type': 'application/json'
.then (response) -> response.json()
.then (json) ->
  { test_run_id, app_name, time_stamp, test_cases } = json

  # Load the retrieved data into Vue
  v.setID(test_run_id)
  v.setLoading(false);
  v.setName(app_name)
  v.setTimestamp(time_stamp)
  v.setTestCases(test_cases)

