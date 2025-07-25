// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven()-> Int {
  40
}
// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(init: Int)-> Int {
  expected_minutes_in_oven() - init
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(numlyrs: Int)-> Int {
  2 * numlyrs
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(lyrs: Int, min: Int)-> Int {
  min + 2 * lyrs
}

// Please define the alarm function
pub fn alarm()-> String {
  "Ding!"
}
