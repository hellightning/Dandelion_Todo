export default {
  state: {
    doneList: [
      // 举个例子，数据格式为
      {
        title: '人工智能基础',
        description: 'BITRobot',
        deadline: '2022-1-11-23-00',
        completeAt: '2022-1-9-23-00',
        doneId: 10
      }
    ]
  },
  mutations: {
    addDoneEntity (state, doneEntity) {
      state.doneList.push(doneEntity)
    }
  }
}