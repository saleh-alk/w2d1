class Bootcamp

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|k, v| k[v] = []}

    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str)
        @teachers << str
    end

    def enroll(str)
        if @students.length < @student_capacity
            @students << str
            true
        else
            false
        end
    end

    def enrolled?(str)
        @students.include?(str)
    end

    def student_to_teacher_ratio
        @students.length/@teachers.length
    end

    def add_grade(name, grade)
        if @students.include?(name)
            @grades[name] << grade
            true
        else
            false
        end
    end

    def num_grades(str)
        @grades[str].length
    end

    def average_grade(str)
        return nil if @grades[str] == []
        @grades[str].sum/@grades[str].length
    end


end
