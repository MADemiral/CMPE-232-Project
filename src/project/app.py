from flask import Flask, render_template, request, redirect, url_for, session
from database_operations import Database_operations

app = Flask(__name__)
app.secret_key = 'your_secret_key'
obj = Database_operations()

class WebApp:
    @staticmethod
    @app.route('/')
    def menu():
        session.pop('show_alert', None)
        session.pop('message', None)
        return render_template('menu.html')

    @staticmethod
    @app.route('/visitor')
    def visitor():
        prisoner_data = obj.select_from_table('prisoners')
        show_alert = session.pop('show_alert', False)
        message = session.pop('message', '')
        return render_template('visitor.html', prisoner_data=prisoner_data, message=message, show_alert=show_alert)
    
    @staticmethod
    @app.route('/login', methods=['POST'])
    def login():
        username = request.form.get('username')
        password = request.form.get('password')

        if username == 'admin' and password == 'admin':  
            return redirect(url_for('control'))
        else:
            print(username, password)
            session['show_alert'] = True
            session['message'] = 'Wrong username or password'
            

        return redirect(url_for('admin'))
    
  
    @staticmethod
    @app.route('/control')
    def control():
        show_alert = session.pop('show_alert', False)
        message = session.pop('message', '')
        print(show_alert, message)
        return render_template('control.html', message=message, show_alert=show_alert)
    
    @staticmethod
    @app.route('/visitors_management')
    def visitors_management():
        visitor_data = obj.select_from_table('visitor_view')
        show_alert = session.pop('show_alert', False)
        message = session.pop('message', '')
        return render_template('visitors_management.html',visitor_data=visitor_data,message=message,show_alert=show_alert)
    
    @staticmethod
    @app.route('/manage_visitors', methods=['POST'])
    def manage_visitors():

        visitors_id_in_db = obj.select_column_from_table('v_ssn', 'visitors')
        v_ssn = request.form.get('v_ssn', '')
        visitor_phone_no_in_db = obj.select_column_from_table('v_phone_no', f"v_phone_no where v_ssn = {int(v_ssn)}")

        v_name = request.form.get('v_name', '')
        v_surname = request.form.get('v_surname', '')
        v_phone_no = request.form.get('v_phone_no', '')
        v_city = request.form.get('v_city', '')
        v_zip = request.form.get('v_zip', '')

        visitor_table_data = {
            'v_ssn':v_ssn,
            'v_name':v_name,
            'v_surname':v_surname
        }
        v_adress_data = {
            'v_ssn':v_ssn,
            'v_city':v_city,
            'v_zip':v_zip
        }
        v_phone_no_data = {
            'v_ssn':v_ssn,
            'v_phone_no':v_phone_no
        }
        
        action = request.form.get('action', '')
        if action=='insert':
            if int(v_ssn) not in visitors_id_in_db:
                print('deneme')
                obj.insert_into_table('visitors',visitor_table_data)
                obj.insert_into_table('v_phone_no',v_phone_no_data)
                obj.insert_into_table('v_address',v_adress_data)
            else:
                session['show_alert'] = True
                session['message'] = 'This user already in Database'

        if action=='update':
            if int(v_ssn) not in visitors_id_in_db:
                session['show_alert'] = True
                session['message'] = 'User not found for update'
            else:
                if v_phone_no not in visitor_phone_no_in_db:
                    obj.insert_into_table('v_phone_no',v_phone_no_data)

                obj.update_table('visitors',visitor_table_data,'v_ssn',v_ssn)
                obj.update_table('v_address', v_adress_data, 'v_ssn',v_ssn)

        if action =='delete':
            
            print(visitors_id_in_db)
            if int(v_ssn) not in visitors_id_in_db:
                session['show_alert'] = True
                session['message'] = 'Visitor not found for delete'
            else:
                obj.delete_by_id('v_phone_no','v_ssn',int(v_ssn))
                obj.delete_by_id('v_address','v_ssn',int(v_ssn))
                obj.delete_by_id('visits','visitor_ssn',int(v_ssn))
                obj.delete_by_id('visitors','v_ssn',int(v_ssn))

        return redirect(url_for('visitors_management'))
        
    

    @staticmethod
    @app.route('/manage_prisoners', methods=['POST'])
    def manage_prisoners():

        prisoners_id_in_db = obj.select_column_from_table('p_ssn', 'prisoners')

        p_ssn = request.form.get('p_ssn', '')
        prisoner_sentences_in_db = obj.select_column_from_table('sentence_id', f"be_judged where prisoner_ssn = {int(p_ssn)}")
        print(prisoner_sentences_in_db)
       

        p_name = request.form.get('p_name', '')
        p_surname = request.form.get('p_surname', '')
        sentence_id = request.form.get('sentence_id', '')
        judgement_date = request.form.get('judgement_date','')
        block_id = request.form.get('block_id', '')
        stay_start_date = request.form.get('stay_start_date', '')

        print(judgement_date)

        prisoners_table_data = {
            'p_ssn':p_ssn,
            'p_name':p_name,
            'p_surname':p_surname
        }
        be_judged_data = {
            'prisoner_ssn':p_ssn,
            'sentence_id':sentence_id,
            'judgement_date':judgement_date
        }
        stays_data = {
            'prisoner_ssn':p_ssn,
            'block_id':block_id,
            'stay_start_date':stay_start_date,
            'stay_end_date':'9999-01-01'
            
        }
        visits_data = {
            'prisoner_ssn':p_ssn
        }
        
        action = request.form.get('action', '')
        if action=='insert':
            if int(p_ssn) not in prisoners_id_in_db:
                print('deneme')
                obj.insert_into_table('prisoners',prisoners_table_data)
                obj.insert_into_table('be_judged',be_judged_data)
                obj.insert_into_table('stays',stays_data)
            else:
                session['show_alert'] = True
                session['message'] = 'This user already in Database'

        if action=='update':
            if int(p_ssn) not in prisoners_id_in_db:
                session['show_alert'] = True
                session['message'] = 'User not found for update'
            else:
                if sentence_id not in prisoner_sentences_in_db:
                    obj.insert_into_table('be_judged',be_judged_data)

                obj.update_table('stays',stays_data,'prisoner_ssn',p_ssn)
                obj.update_table('prisoners', prisoners_table_data, 'p_ssn',p_ssn)

        if action =='delete':
            
            print(prisoners_id_in_db)
            if int(p_ssn) not in prisoners_id_in_db:
                session['show_alert'] = True
                session['message'] = 'Visitor not found for delete'
            else:
                obj.delete_by_id('visits','prisoner_ssn',int(p_ssn))
                obj.delete_by_id('stays','prisoner_ssn',int(p_ssn))
                obj.delete_by_id('be_judged','prisoner_ssn',int(p_ssn))
                obj.delete_by_id('prisoners','p_ssn',int(p_ssn))

        return redirect(url_for('prisoners_management'))

    @staticmethod
    @app.route('/prisoners_management')
    def prisoners_management():

        prisoner_data = obj.select_from_table('prisoner_view')
        show_alert = session.pop('show_alert', False)
        message = session.pop('message', '')
        return render_template('prisoners_management.html',prisoner_data=prisoner_data, message=message, show_alert=show_alert)
    
   
    @staticmethod
    @app.route('/admin')
    def admin():

        show_alert = session.pop('show_alert', False)
        message = session.pop('message', '')
        print(show_alert, message)
        return render_template('admin.html', message=message, show_alert=show_alert)

    
    @staticmethod
    @app.route('/insert_visitor', methods=['POST'])
    def insert():

        prisoner_ids_in_db = obj.select_column_from_table('p_ssn', 'prisoners')
        visitors_id_in_db = obj.select_column_from_table('v_ssn', 'visitors')
        

        p_ssn = request.form.get('p_ssn', '')
        v_ssn = request.form.get('v_ssn', '')
        v_name = request.form.get('v_name', '')
        v_surname = request.form.get('v_surname', '')
        v_phone_no = request.form.get('v_phone_no', '')
        v_city = request.form.get('v_city', '')
        v_zip = request.form.get('v_zip', '')
        date = request.form.get('v_date', '')
 
        can_create_date = obj.select_from_table_with_where('visits',f"where prisoner_ssn = {int(p_ssn)} and visit_date = '{date}'")
        visitor_phone_no_in_db = obj.select_column_from_table('v_phone_no', f"v_phone_no where v_ssn = {int(v_ssn)}")

        visitor_table_data = {
            'v_ssn':v_ssn,
            'v_name':v_name,
            'v_surname':v_surname
        }
        v_adress_data = {
            'v_ssn':v_ssn,
            'v_city':v_city,
            'v_zip':v_zip
        }
        v_phone_no_data = {
            'v_ssn':v_ssn,
            'v_phone_no':v_phone_no
        }
        visits_table_data = {
            'visitor_ssn':v_ssn,
            'prisoner_ssn':p_ssn,
            'visit_date':date
        }
        message = 'Default Message'
        
        if int(p_ssn) not in prisoner_ids_in_db:
            session['show_alert'] = True
            session['message'] = 'Prisoner not found'


        
        if len(can_create_date)>0:
            session['show_alert'] = True
            session['message'] = 'You can not visit prisoner on this date'

        if int(v_ssn) not in visitors_id_in_db and len(v_ssn)==9:
            obj.insert_into_table('visitors',visitor_table_data)
            obj.insert_into_table('v_address',v_adress_data)
            obj.insert_into_table('v_phone_no',v_phone_no_data)
            if len(can_create_date)==0:
                if int(p_ssn) in prisoner_ids_in_db:
                    obj.insert_into_table('visits', visits_table_data)
        else:
            if v_phone_no not in visitor_phone_no_in_db:
                obj.insert_into_table('v_phone_no',v_phone_no_data)
            obj.update_table('v_address',v_adress_data,'v_ssn',v_ssn)
            obj.update_table('visitors',visitor_table_data,'v_ssn',v_ssn)
            if int(p_ssn) in prisoner_ids_in_db:
                if len(can_create_date)==0:
                    obj.insert_into_table('visits', visits_table_data)
        return redirect(url_for('visitor'))

if __name__ == '__main__':
    app.run(debug=True, port=50)
