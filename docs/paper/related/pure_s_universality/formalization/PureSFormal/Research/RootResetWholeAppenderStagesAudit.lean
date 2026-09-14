import PureSFormal.Research.RootResetWholeAppenderStages

namespace PureSFormal.Research.RootResetWholeAppenderStages

#print axioms parseRow?_sound
#print axioms parseRow?_complete
#print axioms Row.position_lt_emitted_length
#print axioms Row.focus_subterm
#print axioms Row.contracts_of_target?_eq_some
#print axioms Row.focus_contractRoot?_of_replacement?_eq_some
#print axioms Row.final_contractAt?_none
#print axioms ActiveShape.rowValid
#print axioms ActiveShape.source_eq
#print axioms parseFreshHalt?_sound
#print axioms parseFreshHalt?_fresh
#print axioms parseActive?_sound
#print axioms parseActive?_complete
#print axioms ActiveView.position_lt_emitted_length
#print axioms ActiveShape.focus_subterm
#print axioms parseActive?_shell_audits_opaque
#print axioms parse?_sound
#print axioms parse?_complete
#print axioms parse?_unique
#print axioms parse?_history_marked
#print axioms View.focus_subterm
#print axioms View.contracts_of_replacement?_eq_some
#print axioms View.selectedAddress_eq_some_of_replacement?_eq_some
#print axioms View.selected_contracts
#print axioms View.final_contractAt?_none
#print axioms View.selectedAddress_none_of_final
#print axioms parseActive?_generated_first
#print axioms parseActive?_generated_second_nonfinal
#print axioms parseActive?_generated_second_final
#print axioms parse?_of_markedPrefix_generated
#print axioms Stage.first_ne_secondNonfinal
#print axioms Stage.first_ne_secondFinal
#print axioms Stage.secondNonfinal_ne_secondFinal
#print axioms parseSecond?_none_of_parseRow?_first
#print axioms parseFirst?_none_of_parseRow?_second

end PureSFormal.Research.RootResetWholeAppenderStages
