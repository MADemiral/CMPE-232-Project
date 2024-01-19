document.addEventListener('DOMContentLoaded', function () {
    const actionSelect = document.getElementById('action');
    const form = document.querySelector('form');

    actionSelect.addEventListener('change', function () {
        
        const existingFields = form.querySelectorAll('.dynamic-field');
        existingFields.forEach(field => field.remove());

        
        const selectedAction = actionSelect.value;

        if (selectedAction === 'insert' || selectedAction === 'update') {
            
            addInputField('p_ssn', 'Prisoner SSN',9,9);
            addInputField('p_name', 'Prisoner Name',1,50);
            addInputField('p_surname', 'Prisoner Surname',1,50);
            addInputField('sentence_id', 'Sentence ID',1,50);
            addInputFieldDAte('judgement_date','Judgement Date')
            addInputField('block_id', 'Block ID',1,50);
            addInputFieldDAte('stay_start_date', 'Stay Start Date');


        } else if (selectedAction === 'delete') {
            
            addInputField('p_ssn', 'Prisoner SSN',9,9);
        }
    });

    function addInputField(name, label, minlength, maxlength,telno) {
        if(telno){
            
        }
        const inputField = document.createElement('div');
        inputField.className = 'form-group dynamic-field';
        inputField.innerHTML = `
            <label for="${name}">${label}</label>
            <input type="text" id="${name}" name="${name}" minlength="${minlength}" maxlength="${maxlength}" required>
        `;
        form.insertBefore(inputField, form.lastElementChild);
    }

    function addInputFieldDAte(name, label) {
        const inputField = document.createElement('div');
        inputField.className = 'form-group dynamic-field';
        inputField.innerHTML = `
            <label for="${name}">${label}</label>
            <input type="date" name="${name}" required>
        `;
        form.insertBefore(inputField, form.lastElementChild);
    }
});

function showAlert(message) {
    alert(message);
}