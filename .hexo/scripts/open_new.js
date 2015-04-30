var exec = require('child_process').exec;
hexo.on('new', function(target){
	exec('open -a "/Applications/Sublime Text.app" ' + target);
	});
