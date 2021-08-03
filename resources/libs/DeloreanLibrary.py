import psycopg2
from logging import info

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-54-235-108-217.compute-1.amazonaws.com',
            database='d4utm39j3lehg8',
            user='xihzqlhwfxwzdj',
            password='66d464a4cbb6715de5d6b504817fd609f07a3a2948ecdad70436c3ce0d985655'
        )

    # No Robot vira uma keyword "automágicamente" => Remove Student   email@desejado.com
    def remove_student(self, email):

        query = f"delete from students where email = '{email}'"
        info(query)
        
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_student_by_name(self, name):
        query = f"delete from students where name LIKE '%{name}%'"
        info(query)
        
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_student(self, student):

        self.remove_student(student['email'])

        query = (f"insert into students (name, email, age, weight, feet_tall, created_at, updated_at) values ('{student['name']}', '{student['email']}', {student['age']}, {student['weight']}, {student['feet_tall']}, now(), now());")
        info(query)
        
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_plan(self, title):
        query = f"delete from plans where title = '{title}'"
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_plan_by_title(self, title):
        query = f"delete from plans where title LIKE '%{title}%'"
        info(query)

        conn = self.connect()
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_plan(self, plan):
        
        self.remove_plan(plan['title'])

        query = (f"insert into plans (title, price, duration, created_at, updated_at) values ('{plan['title']}', {plan['price']}, {plan['duration']}, now(), now());")
        info(query)

        conn = self.connect()
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()