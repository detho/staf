{include $theme['head']}  

{include $theme['navbar']}  

{include $theme['staf-sidebar']} 

  

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    {include $theme['breadcrump']} 

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">

     		
				<div class="row">
					<div class="col-md-6 col-sm-12">
						<div class="card">
							
							<div class="card-body">
                                <div class="row">
									<div class="col-md-3 col-sm-3">
                                    
									<form method="get" action="" id="filterdate">
										<div class="form-group">
										  <label>Filter Date:</label>								  
											<div class="input-group date" id="reservationdate" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#reservationdate" name="date" value="{$date}"autocomplete="off" >
												<div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
													<div class="input-group-text"><i class="fa fa-calendar"></i></div>
												</div>
											</div>
										</div>
									</form>
									
									</div>
								</div>
								<h4 class="header-title">Task Done</h4>
								<br>
								<!-- card tools -->
								<div class="card-tools" style="display: none">
								  
								</div>
								<div class="table-responsive mt-3">
									<table id="datatable" class="table table-bordered table-striped">
										<thead>
											<tr>
                                                <th>Tanggal</th>
                                                <th>Name Staf</th>
                                                <th>type</th>
												<th>count</th>
											</tr>
										</thead>
										<tbody id="ListTrade">
										{if count($cust['data']) > 0}										
										{foreach from=$cust['data'] item=p key="key"}
										<tr id="tr{$p['id']}">
                                            <td>{$p['task_date']}</td>
                                            <td>{$p['name_staf']}</td>
                                            <td>{if $p['type'] == 3}Support{elseif $p['type'] == 2}Present{elseif $p['type'] == 1}CS{/if}</td>
									  	    <td>{$p['done_count']}</td>
											  <textarea id="json{$p['id']}" style="display:none">{$p|@json_encode}</textarea>
										</tr>
										{/foreach} 
										{/if}
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				    
                    <div class="col-md-6 col-sm-12">
						<div class="card">
							
							<div class="card-body">
                                <div class="row">
									<div class="col-md-3 col-sm-3">

									</div>
								</div>
								<h4 class="header-title">Activity Staff</h4>
								<br>
								<!-- card tools -->
								<div class="card-tools" style="display: none">
								  
								</div>
								<div class="table-responsive mt-3">
									<table id="datatable2" class="table table-bordered table-striped">
										<thead>
											<tr>
                                                <th>Tanggal</th>
                                                <th>Name Staf</th>
												<th>count</th>
                                                <th>score</th>
											</tr>
										</thead>
										<tbody id="ListTrade">
										{if count($activity['data']) > 0}										
										{foreach from=$activity['data'] item=p key="key"}
										<tr id="tr{$p['id']}">
                                            <td>{$p['task_date']}</td>
                                            <td>{$p['name_staf']}</td>
									  	    <td>{$p['done_count']}</td>
                                            <td>{$p['score_count']}</td>
											  <textarea id="json{$p['id']}" style="display:none">{$p|@json_encode}</textarea>
										</tr>
										{/foreach} 
										{/if}
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
                </div>
				<!-- end row -->

      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<div class="modal fade" id="frmADD">
  <div class="modal-dialog">
	<div class="modal-content">

	  <!-- Modal Header -->
	  <div class="modal-header">
		<h4 class="modal-title">Tambah</h4>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
	  <!-- Modal body -->
	  <div class="modal-body">
		<div class="row">  
			<div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Name</label>
					<input class="form-control" type="text" placeholder="Enter Name" name="name" id="name">
				<span class="material-input"></span></div>
			</div> 
            <div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Phone</label>
					<input class="form-control" type="tel" placeholder="Enter phone" name="phone" id="phone">
				<span class="material-input"></span></div>
			</div>
            <div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Email</label>
					<input class="form-control" type="email" placeholder="Enter email" name="email" id="email">
				<span class="material-input"></span></div>
			</div>
		</div>
	  </div>

	  <!-- Modal footer -->
	  <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		<button class="btn btn-primary" onclick="simpan()">Simpan</button>
	  </div>

	</div>
  </div>
</div>

{include $theme['footer']}  
{literal}
<script>
  $(function () {
    $('#reservationdate').datetimepicker({
        format: 'YYYY-MM'
    });
	$("#reservationdate").on("change.datetimepicker", ({date}) => {
		$('#filterdate').submit();
	})
  })
  $( document ).ready(function() {
		
	});
  function clearform(){
      $("#code").val('');
  }
    
  function status_done(id){
    //waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'status_done', 'id' : id},
		dataType: "json",
		success: function(e) { 	
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
			if( e.code == 1){
                $('#tr'+id).remove();
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }

    
  function simpan(){
	$("#frmAddINOUT").modal('hide');
	waitingDialog.show('Loading..');
	var dt = {act:'add', code: $("#code").val()};
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: dt,
		dataType: "json",
		success: function(e) {
			setTimeout(function(){
				waitingDialog.hide();
			}, 2000);			
			if(e.code==1){
				openmsg(e.msg, 'success');
				setTimeout(function () {
				  window.location.href = window.document.URL;
				}, 2000);
			}else{
				openmsg(e.msg, 'error');
				$("#frmAddINOUT").modal('show');
			}						
		},error: function() {
			$("#frmAddINOUT").modal('show');
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');
			setTimeout(function(){
				waitingDialog.hide();
			}, 2000);
		}
	});
}
    
function openmsg(msg, tipe){
	const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 2500
    });
	Toast.fire({
        icon: tipe,
        title: msg
      })
}
    
function copyTextToClipboard(text) {
  navigator.clipboard.writeText(text).then(function() {
      openmsg('Text copied to clipboard', 'success');
  }).catch(function(error) {
      openmsg('Error copying text: '+error, 'error');
  });
}
    
var dtIntegration = function() {
	$.extend(true, $.fn.dataTable.defaults, {
		"sDom": "<'row'<'col-sm-6 col-xs-5'l><'col-sm-6 col-xs-7'f>r>t<'row'<'col-sm-5 hidden-xs'i><'col-sm-7 col-xs-12 clearfix'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sSearch": "<div class=\"input-group\">_INPUT_<span class=\"input-group-addon\"><i class=\"fa fa-search\"></i></span></div>",
			"sInfo": "<strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>",
			"oPaginate": {
				"sPrevious": "",
				"sNext": ""
			}
		}
	});
	$.extend($.fn.dataTableExt.oStdClasses, {
		"sWrapper": "dataTables_wrapper form-inline",
		"sFilterInput": "form-control",
		"sLengthSelect": "form-control"
	});
};
  $(function () {
    $('#datatable').DataTable({
      "responsive": true,
      "autoWidth": false,
        "order": [[0, "desc" ]]
    });
      
    $('#datatable2').DataTable({
      "responsive": true,
      "autoWidth": false,
        "order": [[0, "desc" ]]
    });
  });
</script>
{/literal}