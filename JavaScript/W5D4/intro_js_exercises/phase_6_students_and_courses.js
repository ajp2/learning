function Student(fName, lName) {
  this.fName = fName;
  this.lName = lName;
  this.courses = [];
}

Student.prototype.name = function() {
  return `${this.fName} ${this.lName}`;
};

Student.prototype.enoll = function(course) {
  if (this.hasConflict(course)) {
    throw "Course times conflicts with existing enrollments";
  }

  if (!this.courses.includes(course)) {
    this.courses.push(course);
    course.students.push(this);
  }
};

Student.prototype.hasConflict = function(course) {
  this.courses.forEach(student_course => {
    if (student_course.conflictsWith(course)) {
      return true;
    }
  });

  return false;
}

Student.prototype.courseLoad = function() {
  courseHash = {};
  this.courses.forEach(course => {
    if (courseHashp[course]) {
      courseHash[course] += course.credits
    } else {
      courseHash[course] = course.credits
    }
  });
};


function Course(name, depart, credits, days, time_block) {
  this.name = name;
  this.depart = depart;
  this.credits = credits;
  this.days = days;
  this.time_block = time_block;
  this.students = [];
}

Course.prototype.addStudent = function(student) {
  student.enroll(this);
}

Course.prototype.conflictsWith = function(course) {
  course.days.forEach(day => {
    course.time_block.forEach(block => {
      if (this.days.includes(day) && this.time_block.includes(block)) {
        return true;
      }
    });
  });

  return false;
};
