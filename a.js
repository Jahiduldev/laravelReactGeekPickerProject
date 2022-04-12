let array = [{
	name: "Jahid",
    value: 300
},
{
	name: "Nahid",
    value: 100
},
{
	name: "Nasrin",
    value: 200
},
{
	name: "Nahid",
    value: 150
},
{
	name: "Jahid",
    value: 600
},
{
	name: "Nasrin",
    value: 400
}];

let A = [];
let B = [];

for(const element of array) 
{
    const name = element.name;
    const value = element.value;

	if(A[name]) {
        A[name] = A[name] + value;
    } else {
        A[name] = value;
        B.push(name);
    }
}

let output = [];

for(const singleElement of B) {
    output.push({
        name: singleElement,
        value: A[singleElement]
    })
}

console.log(output);