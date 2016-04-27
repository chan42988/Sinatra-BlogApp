users = User.create([

	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},
	{email: "", fname: "", lname: ""},

])

Post.create([
	{user_id: users.sample.id}
	])